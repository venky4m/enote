package com.User;

public class VideoPost {
	private int nid;
	private String title;
	private String projectName;
	private String note;
	private float time;
	private String videoId;

	public VideoPost(int nid, String title, String note, float time, String videoId,String projectName) {
		super();
		this.nid = nid;
		this.title = title;
		this.note = note;
		this.time = time;
		this.videoId = videoId;
		this.projectName=projectName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	@Override
	public String toString() {
		return "VideoPost [nid=" + nid + ", title=" + title + ", note=" + note + ", time=" + time + ", videoId="
				+ videoId + "]";
	}
	public VideoPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNote() {
		return note;
	} 
	public void setNote(String note) {
		this.note = note;
	}
	public float getTime() {
		return time;
	}
	public void setTime(float time) {
		this.time = time;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	
}
