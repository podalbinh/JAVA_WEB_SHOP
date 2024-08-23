package com.example.demo.exception;

import java.util.Date;

import org.apache.catalina.connector.ClientAbortException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
public class GlobalExceptionHandler {
        @ExceptionHandler(ResourceNotFoundException.class) 
        public ResponseEntity<ErrorDetails> handleResourceNotFoundException(ResourceNotFoundException exception,
                                                                                WebRequest webRequest){
                ErrorDetails errorDetails = new ErrorDetails(new Date(), exception.getMessage(),
                        webRequest.getDescription(false));
                return new ResponseEntity<>(errorDetails, HttpStatus.NOT_FOUND);
        }

        @ExceptionHandler(DataAccessException.class)
        public ResponseEntity<ErrorDetails> handleDataAccessException(DataAccessException exception,
                                                                                WebRequest webRequest){
                ErrorDetails errorDetails = new ErrorDetails(new Date(), exception.getMessage(),
                        webRequest.getDescription(false));
                return new ResponseEntity<>(errorDetails, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        @ExceptionHandler(Exception.class)
        public ResponseEntity<ErrorDetails> handleGlobalException(Exception exception,
                                                                WebRequest webRequest){
                ErrorDetails errorDetails = new ErrorDetails(new Date(), exception.getMessage(),
                        webRequest.getDescription(false));
                return new ResponseEntity<>(errorDetails, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(ClientAbortException.class)
    public void handleClientAbortException(ClientAbortException e) {
        // Log the exception at a lower level
        logger.debug("Client aborted the connection: {}", e.getMessage());
        // You can also choose not to log this if it happens frequently and is not critical
    }
}
