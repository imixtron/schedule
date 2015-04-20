package schedule.action;

import java.util.ArrayList;
import java.util.HashMap;

import schedule.bean.Day;
import schedule.bean.Room;
import schedule.bean.Schedule;
import schedule.bean.SlotType;
import schedule.service.DayDAO;
import schedule.service.RoomDAO;
import schedule.service.ScheduleDAO;
import schedule.service.SlotTypeDAO;

public class ScheduleAction {
	
	

	public String ShowCampus() {
		System.out.print("execute");
		this.days = new DayDAO().List();
		this.rooms = new RoomDAO().List(this.getCampus());
		this.slots = new SlotTypeDAO().List();
		this.scheduleMap = scheduleDAO.ListByCapmus(this.getCampus());
		return "success";
	}

//	public String listData(String campus) {
//		
//		this.days = new DayDAO().List();
//		this.rooms = new RoomDAO().List(campus);
//		return "success";	
//	}

	ArrayList<Day> days = new ArrayList<Day>();
	ArrayList<Room> rooms = new ArrayList<Room>();
	ArrayList<SlotType> slots = new ArrayList<SlotType>();
	String campus;
	Schedule schedule = new Schedule();
	ScheduleDAO scheduleDAO = new ScheduleDAO();

	HashMap<String, java.util.List<Schedule>> scheduleMap = new HashMap<String, java.util.List<Schedule>>();
	
	public HashMap<String, java.util.List<Schedule>> getScheduleMap() {
		return scheduleMap;
	}
	public void setScheduleMap(HashMap<String, java.util.List<Schedule>> scheduleMap) {
		this.scheduleMap = scheduleMap;
	}

	public ArrayList<SlotType> getSlots() {
		return slots;
	}
	public void setSlots(ArrayList<SlotType> slots) {
		this.slots = slots;
	}
	public String getCampus() {
		return campus;
	}

	public void setCampus(String campus) {
		this.campus = campus;
	}
	public ArrayList<Day> getDays() {
		return days;
	}
	public void setDays(ArrayList<Day> days) {
		this.days = days;
	}
	public ArrayList<Room> getRooms() {
		return rooms;
	}
	public void setRooms(ArrayList<Room> rooms) {
		this.rooms = rooms;
	}

}
