/**
 * 
 */
package schedule.service;

import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import schedule.bean.OfferedCourses;
import schedule.data.Database;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * @author ImadAli
 *
 */
public class Crud {

	public static String insertClasses(String Query){
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		if(Query==null)
			return "false";
		System.out.println(Query);
		try {
			pstmt = Database.getConnection().prepareStatement(Query);
			pstmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println(Query);
			e1.printStackTrace();
			return "false";
		}
		
		return "true";
	}
	
	public static String deleteFromTable(int scheduleKey)
	{
		Statement stmt;
		try {
			stmt = Database.getConnection().createStatement();
			String sql = "DELETE FROM schedule WHERE schid ="+ scheduleKey +" ";
		    stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "false";
		}
		return "true";
	}
	
	public static String insertOff(String offeredCourses) {
		Connection conn = Database.getConnection();
		Gson gson = new Gson();
		List<OfferedCourses> o = new ArrayList<OfferedCourses>();

		Type listOfTestObject = new TypeToken<List<OfferedCourses>>(){}.getType();
		o = gson.fromJson(offeredCourses, listOfTestObject);
		
        String InsertOffered,InsertSection;
		
		PreparedStatement pstmt = null;
		for (OfferedCourses offeredCourses2 : o) {
			System.out.println(offeredCourses2.getCourseid()+", "+offeredCourses2.getTeacherid()+", "+offeredCourses2.getSectionDetails());
			List<Integer> s = offeredCourses2.getSectionDetails();
			//System.out.println(s);
			
			try {
				InsertOffered = "INSERT INTO offeredcourse2 VALUE(NULL,"+offeredCourses2.getCourseid()+","+offeredCourses2.getTeacherid()+");";
				pstmt = conn.prepareStatement(InsertOffered);
				pstmt.executeUpdate();

				for (Integer in : s) {
					System.out.println("sectionid:"+in);
					InsertSection = "INSERT INTO `sectiondetails` VALUE (LAST_INSERT_ID(), "+in+");";
					pstmt = conn.prepareStatement(InsertSection);
					pstmt.executeUpdate();					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			pstmt.executeUpdate();
		}
		return null;
	}

}
