/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import javax.swing.JOptionPane;
import modelo.Usuarios;
import modelo.categoria;
import modelo.conexion;
import modelo.pregunta;
import vista.vista_2;

/**
 *
 * @author mateo
 */
public class controlador {
    
  conexion conexion= new conexion();//invocacion de la conexion a la bd
  vista_2 vista=new vista_2();// invocar a la vista del juego

    public LinkedList<categoria> mostrarcategorias() 
    {
    //metodo para poder listar las categorias disponibles
    LinkedList<categoria> c=new LinkedList<>();
             try (Connection cone=DriverManager.getConnection(conexion.getUrl(), conexion.getUser(), conexion.getPassword()))
         {
             String query="SELECT *FROM categoria ";
             PreparedStatement preparar=cone.prepareStatement(query);
             ResultSet resultado=preparar.executeQuery();
             while(resultado.next())
             {
                int id=resultado.getInt(1);
                String categoria=resultado.getString(2);
                categoria cate=new categoria(id,categoria);
                c.add(cate);
             }
             return c;
         } catch (Exception e) 
         {
             e.printStackTrace();
            return c;
         }
    
    }

    public LinkedList<pregunta> buscarpreguntas(int categorias, int nivel) { 
        /*metodo pirncipal del juego,nos permite buscar las preguntas
          que se van a jugar por categoria y nivel
        */
        
        LinkedList<pregunta> a=new LinkedList<>();
        try (Connection cone=DriverManager.getConnection(conexion.getUrl(), conexion.getUser(), conexion.getPassword()))
        {
             String query="SELECT *FROM pregunta WHERE nivel = ? AND id_categoria=?";
             PreparedStatement preparar=cone.prepareStatement(query);
             preparar.setString(1,String.valueOf(nivel));
             preparar.setString(2,String.valueOf(categorias));
             ResultSet resultado=preparar.executeQuery();
             while(resultado.next())
             {
                int id=resultado.getInt(1);
                String pregunta=resultado.getString(2);
                String rta1=resultado.getString(3);
                String rta2=resultado.getString(4);
                String rta3=resultado.getString(5);
                String rta4=resultado.getString(6);
                int categoria=resultado.getInt(7);
                int nivels=resultado.getInt(8);
                pregunta p = new pregunta(id, pregunta, rta1, rta2, rta3, rta4, categoria, nivels);
                 a.add(p);
             }
             return a;
         } catch (Exception e) 
         {
             e.printStackTrace();
            return a;
         }
    }

    public  LinkedList<categoria> sacarcodigo(String categorias) {
        /*metodo que nos permite buscar el codigo de la categoria 
          para luego poder aplicarla a la busqueda de la pregunta
        */
        
        LinkedList<categoria> c=new LinkedList<>();
        try (Connection cone=DriverManager.getConnection(conexion.getUrl(), conexion.getUser(), conexion.getPassword()))
        {
             String query="SELECT *FROM categoria WHERE categoria = ?";
             PreparedStatement preparar=cone.prepareStatement(query);
             preparar.setString(1,String.valueOf(categorias));
             ResultSet resultado=preparar.executeQuery();
             while(resultado.next())
             {
                int id=resultado.getInt(1);
                String categoria=resultado.getString(2);
                categoria cate=new categoria(id,categoria);
                c.add(cate);
             }
             return c;
         } catch (Exception e)
         {
             e.printStackTrace();
            return c;
         }
       
    }

    public void crearregistro(Usuarios user) {
        /*metodo que nos permire guardar los datos
          de los participantes
        */
        
        try (Connection cone=DriverManager.getConnection(conexion.getUrl(), conexion.getUser(), conexion.getPassword()))
        {
             String query="INSERT INTO usuarios (nombre,puntaje,categoria) VALUES (?,?,?)";
             PreparedStatement preparar=cone.prepareStatement(query , Statement.RETURN_GENERATED_KEYS);
             preparar.setString(1,user.getNombres());
             preparar.setString(2,user.getPuntaje());
             preparar.setString(3,user.getCategoria());
             int filasinsertadas=preparar.executeUpdate();
             if(filasinsertadas>0)
             {
                 JOptionPane.showMessageDialog(vista, "felicidades,GANASTE");
             }
            
         } catch (Exception e) 
         {
             e.printStackTrace();
             
         }
    }

    public LinkedList<Usuarios> mostrarpuntaje() {
        /*metodo que nos permite ver los registros de las personas que han
          jugado el juego y han ganado
        */
        
         LinkedList<Usuarios> c=new LinkedList<>();
             try (Connection cone=DriverManager.getConnection(conexion.getUrl(), conexion.getUser(), conexion.getPassword()))
         {
             String query="SELECT *FROM usuarios Order by puntaje DESC ";
             PreparedStatement preparar=cone.prepareStatement(query);
             ResultSet resultado=preparar.executeQuery();
             while(resultado.next())
             {
                int id=resultado.getInt(1);
                String name=resultado.getString(2);
                String resultados=resultado.getString(3);
                String cate=resultado.getString(4);
                Usuarios cliente=new Usuarios(name,resultados,cate);
                c.add(cliente);
             }
             return c;
         } catch (Exception e)
         {
             e.printStackTrace();
            return c;
         }
    }

    public void crearregistro2(Usuarios user) {
        /*metodo que nos permite ver los registros de las personas que han
          jugado el juego y han perdido
        */
       try (Connection cone=DriverManager.getConnection(conexion.getUrl(), conexion.getUser(), conexion.getPassword()))
       {
             String query="INSERT INTO usuarios (nombre,puntaje,categoria) VALUES (?,?,?)";
             PreparedStatement preparar=cone.prepareStatement(query , Statement.RETURN_GENERATED_KEYS);
             preparar.setString(1,user.getNombres());
             preparar.setString(2,user.getPuntaje());
             preparar.setString(3,user.getCategoria());
             int filasinsertadas=preparar.executeUpdate();
         } catch (Exception e) 
         {
             e.printStackTrace();
             
         }
    }
    
}
