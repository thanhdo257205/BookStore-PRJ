/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author dotha
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
    
    private int id;
    private String name;
    private String image;
    private int quantity;
    private float price;
    private String description;
    private int categoryId;
    
}
