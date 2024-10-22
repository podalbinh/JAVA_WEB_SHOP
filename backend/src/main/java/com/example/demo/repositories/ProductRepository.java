package com.example.demo.repositories;
import com.example.demo.entities.Product;

import java.util.List;

import com.example.demo.models.ExcelDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
    @Query("SELECT p FROM Product p WHERE " +
            "p.name LIKE CONCAT('%',:query, '%')" +
            "Or p.description LIKE CONCAT('%', :query, '%')")
    List<Product> searchProducts(String query);

    @Query(
            "SELECT DISTINCT p.id AS id, " +
                    "p.name AS productName, " +
                    "c.name AS color, " +
                    "cat.name AS category, " +
                    "SUM(oi.quantity) * MAX(oi.price) AS revenue, " +
                    "SUM(oi.quantity) as quantity, " +
                    "p.price AS price " +
                    "FROM Order o " +
                    "JOIN o.orderItems oi " +
                    "JOIN oi.product p " +
                    "JOIN p.color c " +
                    "JOIN p.category cat " +
                    "WHERE YEAR(o.createdAt) = :year AND MONTH(o.createdAt) = :month " +
                    "GROUP BY p.id")
    List<ExcelDTO> getValueExcel(@Param("year") int year, @Param("month") int month);

}
