package schedule.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import schedule.bean.Section;
import schedule.data.Database;

public class SectionDAO {
	public ArrayList<Section> List(int program) {

		ArrayList<Section> alSection = new ArrayList<Section>();
		try {

			Statement stmt = Database.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM section WHERE programid = '"+program+"'");
			while (rs.next()) {
				Section section = new Section();
				section.setSecid(rs.getInt("secid"));
				section.setSectionname(rs.getString("sectionname"));
				section.setProgramid(rs.getInt("programid"));
				alSection.add(section);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("no sec");
		}

		return alSection;
	}

}
