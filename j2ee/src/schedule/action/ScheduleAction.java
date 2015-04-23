package schedule.action;

import java.util.ArrayList;
import java.util.HashMap;

import schedule.bean.Day;
import schedule.bean.Room;
import schedule.bean.Schedule;
import schedule.bean.Section;
import schedule.bean.SlotType;
import schedule.service.DayDAO;
import schedule.service.RoomDAO;
import schedule.service.ScheduleDAO;
import schedule.service.SectionDAO;
import schedule.service.SlotTypeDAO;

public class ScheduleAction {
	
	

	public String ShowCampus() {
		if (this.program != 0) {
			this.days = new DayDAO().List();
			this.slots = new SlotTypeDAO().List_slots(slottype);
			this.scheduleMap = scheduleDAO.ListByProgram(getProgram());
			this.sections = new SectionDAO().List(program);
			return "programs";
		}
		else {
			System.out.print("execute");
			this.days = new DayDAO().List();
			this.rooms = new RoomDAO().List(this.getCampus());
			this.slots = new SlotTypeDAO().List();
			this.scheduleMap = scheduleDAO.ListByCapmus(this.getCampus());
			return "success";
		}
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
	int program = 0;
	ArrayList<Section> sections = new ArrayList<Section>();
	int slottype;

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
	public int getProgram() {
		return program;
	}
	public void setProgram(int program) {
		this.program = program;
	}
	public ArrayList<Section> getSections() {
		return sections;
	}
	public void setSections(ArrayList<Section> sections) {
		this.sections = sections;
	}
	public int getSlottype() {
		return slottype;
	}
	public void setSlottype(int slotype) {
		this.slottype = slotype;
	}

}
