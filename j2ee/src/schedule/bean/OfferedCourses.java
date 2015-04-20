package schedule.bean;

import java.util.List;

public class OfferedCourses {
	int courseid;
	//List<SectionDetails> secid = new ArrayList<SectionDetails>();
	int teacherid;
	List<Integer> sectionDetails;
	
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public List<Integer> getSectionDetails() {
		return sectionDetails;
	}
	public void setSectionDetails(List<Integer> sectionDetails) {
		this.sectionDetails = sectionDetails;
	}
}
