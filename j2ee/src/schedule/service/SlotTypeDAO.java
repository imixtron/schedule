package schedule.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import schedule.bean.SlotType;
import schedule.data.Database;

public class SlotTypeDAO {
	public ArrayList<SlotType> List(){
		// slottypeid, duration, slotno, slottype, subslot    
		
		ArrayList<SlotType> alSlotType = new ArrayList<SlotType>();
		try {
			Statement stmt = Database.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM slottype WHERE slottype = 1 ORDER BY slotno");
			
			while(rs.next()){
				SlotType slottype = new SlotType();
				slottype.setSlottypeid(rs.getInt("slottypeid"));
				slottype.setDuration(rs.getString("duration"));
				slottype.setSlotno(rs.getInt("slotno"));
				slottype.setSlottype(rs.getInt("slottype"));
				slottype.setSubslot(rs.getInt("subslot"));
				
				alSlotType.add(slottype);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alSlotType;
	}
	
	public ArrayList<SlotType> List_slots(int slott){
		// slottypeid, duration, slotno, slottype, subslot    
		
		ArrayList<SlotType> alSlotType = new ArrayList<SlotType>();
		try {
			Statement stmt = Database.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM slottype WHERE slottype = '"+slott+"' ORDER BY slotno");
			
			while(rs.next()){
				SlotType slottype = new SlotType();
				slottype.setSlottypeid(rs.getInt("slottypeid"));
				slottype.setDuration(rs.getString("duration"));
				slottype.setSlotno(rs.getInt("slotno"));
				slottype.setSlottype(rs.getInt("slottype"));
				slottype.setSubslot(rs.getInt("subslot"));
				
				alSlotType.add(slottype);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("not slot");
		}
		return alSlotType;
	}
}
