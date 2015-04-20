package schedule.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import schedule.bean.Day;
import schedule.data.Database;

public class DayDAO {
	public ArrayList<Day> List(){
		//schid, offid, slotid, teachername, title, SECTION, dayid, slotno, roomid, occupied
		
		ArrayList<Day> alDay = new ArrayList<Day>();
		try {
			Statement stmt = Database.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM days");
			
			while(rs.next()){
				Day day = new Day();
				day.setDayid(rs.getInt("dayid"));
				day.setDayname(rs.getString("dayname"));
				
				alDay.add(day);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alDay;
	}

}
