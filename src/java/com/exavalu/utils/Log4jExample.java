/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.utils;

import org.apache.log4j.Logger;

/**
 *
 * @author Ayshik Palit
 */
public class Log4jExample {
    
    private static final Logger logger = Logger.getLogger(Log4jExample.class.getName());
    
    public static void main(String[] args) {
        logger.debug("Debug Message Logged !!!");
        logger.info("Info Message Logged !!!");
        logger.error("Error Message Logged !!!", new NullPointerException("NullError"));
    }
    
}
