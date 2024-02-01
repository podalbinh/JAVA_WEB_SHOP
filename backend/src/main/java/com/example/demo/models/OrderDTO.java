package com.example.demo.models;

import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class OrderDTO {

    private Long id;

    @Size(max = 255)
    private String address;

    private String phoneNumber;

    private String firstName;

    private String lastName;

    private Long status;

}
