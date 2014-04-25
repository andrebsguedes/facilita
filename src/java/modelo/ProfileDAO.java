/*
 *Licensed under ..., see LICENSE.md
 *Authors: André Bernardes.
 *Created on: 28/03/2014, 11:23:34
 *Description: Database persistence class for Profile. That includes operations
 *list,update,remove,insert into database.
 */


package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProfileDAO extends DataBaseDAO {

    public ProfileDAO() throws Exception {
    }
    
    /*Insert a Profile object to the database*/
    public void insert(Profile profile) throws SQLException {

	PreparedStatement preparedStatement;
	String sql = "INSERT INTO perfil(perfil) VALUES(?)";
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1, profile.getPerfil());
	preparedStatement.execute();

    }
    
    /*Consult a list of all Profile objects on the database*/
    public ArrayList<Profile> select() throws SQLException, Exception {
	MenuDAO menuDB = new MenuDAO();
	ArrayList<Profile> lista = new ArrayList<Profile>();
	PreparedStatement preparedStatement;
	String sql = "SELECT * FROM perfil";
	preparedStatement = conn.prepareStatement(sql);
	ResultSet rs = preparedStatement.executeQuery();
	while (rs.next()) {
	    menuDB.connect();
	    Profile profile = new Profile(rs.getInt("id"), rs.getString("perfil"),
		    menuDB.menusPerfil(rs.getInt("id")));
	    menuDB.disconnect();
	    lista.add(profile);
	}
	return lista;

    }
    
    /*Delete a Profile object on the database*/
    public void delete(Profile profile) throws SQLException {

	PreparedStatement preparedStatement;
	String sql = "DELETE FROM perfil WHERE id=?";
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setInt(1, profile.getId());
	preparedStatement.execute();

    }
    
    /*Load a Profile object with the id argument on the database*/
    public Profile selectById(int id) throws SQLException, Exception {
	Profile profile = new Profile();
	MenuDAO menuDB = new MenuDAO();
	PreparedStatement preparedStatement;
	String sql = "SELECT * FROM perfil WHERE id=?";
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setInt(1, id);
	ResultSet rs = preparedStatement.executeQuery();
	if (rs.next()) {
	    profile.setId(rs.getInt("id"));
	    profile.setPerfil(rs.getString("perfil"));
	    menuDB.connect();
	    profile.setMenus(menuDB.menusPerfil(id));
	    menuDB.disconnect();
	}
	return profile;

    }
    
    /*Edit a Profile object on the database*/
    public void update(Profile profile) throws SQLException {

	PreparedStatement preparedStatement;
	String sql = "UPDATE perfil SET perfil=? WHERE id=?";
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1, profile.getPerfil());
	preparedStatement.setInt(2, profile.getId());
	preparedStatement.execute();

    }

}