/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.oficinamecanica.dal;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ti.speed
 */
public class ModuloConexao {

    //Método responsavel por estabelecer a conexão com o banco
    public static Connection conector() {
        Connection conexao = null;
        // a linha abaixo chama o driver 
        String driver = "com.mysql.cj.jdbc.Driver";
        // armazenando informações referente ao banco
        String url = "jdbc:mysql://localhost:3306/oficinamecanicadb";
        String user = "root";
        String password = "";
        // estabelecendo a conexão com o banco
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            //a linha abaixo serve de apoio para esclarecer o erro
            System.out.println(e);
            return null;
        }
    }
}
