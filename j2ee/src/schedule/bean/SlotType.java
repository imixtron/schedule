package schedule.bean;

public class SlotType {
	int slottypeid;
	String duration;        
	int slotno;     
	int slottype;     
	int subslot;
	
	public int getSlottypeid() {
		return slottypeid;
	}
	public void setSlottypeid(int slottypeid) {
		this.slottypeid = slottypeid;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public int getSlotno() {
		return slotno;
	}
	public void setSlotno(int slotno) {
		this.slotno = slotno;
	}
	public int getSlottype() {
		return slottype;
	}
	public void setSlottype(int slottype) {
		this.slottype = slottype;
	}
	public int getSubslot() {
		return subslot;
	}
	public void setSubslot(int subslot) {
		this.subslot = subslot;
	}
	
	
}
