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
public class Account {
    
    private int id;
    private String username;
    private String password;
    private String email;
    private String address;
    private int roleId;
    
}
