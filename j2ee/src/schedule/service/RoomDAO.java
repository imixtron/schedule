package schedule.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import schedule.bean.Room;
import schedule.data.Database;

public class RoomDAO {
	public ArrayList<Room> List(String campus){
		// roomid, roomno, campus, roomtype
		
		ArrayList<Room> alRoom = new ArrayList<Room>();
		try {
			Statement stmt = Database.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM room WHERE campus = '"+campus+"'");
			
			while(rs.next()){
				Room room = new Room();
				room.setRoomid(rs.getInt("roomid"));
				room.setRoomno(rs.getString("roomno"));
				room.setCampus(rs.getString("campus"));
				room.setRoomtype(rs.getString("roomtype"));
				
				alRoom.add(room);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alRoom;
	}
}
