package schedule.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import schedule.bean.Schedule;
import schedule.data.Database;

public class ScheduleDAO {
	public HashMap<String, List<Schedule>> ListByCapmus(String campus){
		//schid, offid, slotid, teachername, title, SECTION, dayid, slotno, roomid, occupied
		
		HashMap<String, List<Schedule>> hSchedule = new HashMap<String, List<Schedule>>();
		List<Schedule> alSchedule = null;
		String key, pkey = null;
		try {
			String sql = "SELECT * FROM vschedule2 WHERE campus = ? ORDER By dayid, roomid, slotno, occupied"; 
			PreparedStatement stmt = Database.getConnection().prepareStatement(sql);
			stmt.setString(1, campus);		
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Schedule schedule = new Schedule();
				schedule.setSchid(rs.getInt("schid"));
				schedule.setOffid(rs.getInt("offid"));
				schedule.setSlotid(rs.getInt("slotid"));
				schedule.setTeachername(rs.getString("teachername"));
				schedule.setTitle(rs.getString("title"));
				schedule.setSectionname(rs.getString("sectionname"));
				schedule.setDayid(rs.getInt("dayid"));
				schedule.setSlotno(rs.getInt("slotno"));
				schedule.setRoomid(rs.getInt("roomid"));
				schedule.setOccupied(rs.getInt("occupied"));
				schedule.setDuration(rs.getString("duration"));
				
				key = schedule.getDayid()+"-"+schedule.getRoomid()+"-"+schedule.getSlotno();				
				if(key.equals(pkey)){
					alSchedule.add(schedule);
				}else{
					alSchedule = new ArrayList<Schedule>();
					alSchedule.add(schedule);
				}

				hSchedule.put(key, alSchedule);
				pkey = key;
				System.out.println(key);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
			System.out.print("query fail");
		}
		return hSchedule;
	}
	
	public HashMap<String, List<Schedule>> ListByProgram(int program) {

		HashMap<String, List<Schedule>> hSchedule = new HashMap<String, List<Schedule>>();
		List<Schedule> alSchedule = null;
		String key, pkey = null;

		try {
			String sql = "SELECT * FROM vschedule WHERE programid = ? ORDER BY dayid, slotno, sectionid, occupied";
			PreparedStatement stmt = Database.getConnection().prepareStatement(sql);
			stmt.setInt(1, program);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Schedule schedule = new Schedule();
				schedule.setSchid(rs.getInt("schid"));
				schedule.setOffid(rs.getInt("offid"));
				schedule.setSlotid(rs.getInt("slotid"));
				schedule.setTeachername(rs.getString("teachername"));
				schedule.setTitle(rs.getString("title"));
				schedule.setSectionname(rs.getString("sectionname"));
				schedule.setDayid(rs.getInt("dayid"));
				schedule.setSlotno(rs.getInt("slotno"));
				schedule.setRoomid(rs.getInt("roomid"));
				schedule.setOccupied(rs.getInt("occupied"));
				schedule.setDuration(rs.getString("duration"));
				schedule.setSectionid(rs.getInt("sectionid"));
				schedule.setProgramid(rs.getInt("programid"));
				schedule.setCampus(rs.getString("campus"));
				schedule.setRoomno(rs.getString("roomno"));
				
				key = schedule.getDayid()+ "-" +schedule.getSlotno()+ "-" +schedule.getSectionid();				
				if(key.equals(pkey)){
					alSchedule.add(schedule);
				}else{
					alSchedule = new ArrayList<Schedule>();
					alSchedule.add(schedule);
				}
				
				hSchedule.put(key, alSchedule);
				pkey = key;
//				System.out.println(key);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("query fail");
		}
		return hSchedule;
	}
}
