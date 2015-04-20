package schedule.bean;

public class Schedule {
	int schid;
	int offid;
    int slotid;
	String teachername;
	String title;
	String sectionname;
	int dayid;
	int slotno;
	int roomid;
	int occupied;
	String duration;
	
	
	
	public int getSchid() {
		return schid;
	}
	public void setSchid(int schid) {
		this.schid = schid;
	}
	public int getOffid() {
		return offid;
	}
	public void setOffid(int offid) {
		this.offid = offid;
	}
	public int getSlotid() {
		return slotid;
	}
	public void setSlotid(int slotid) {
		this.slotid = slotid;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String section) {
		this.sectionname = section;
	}
	public int getDayid() {
		return dayid;
	}
	public void setDayid(int dayid) {
		this.dayid = dayid;
	}
	public int getSlotno() {
		return slotno;
	}
	public void setSlotno(int slotno) {
		this.slotno = slotno;
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public int getOccupied() {
		return occupied;
	}
	public void setOccupied(int occupied) {
		this.occupied = occupied;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}

}
