package com.User;

public class Post {
		private String title;
		private String note;
		private int nid;
		
		public Post(String title, String note, int nid) {
			super();
			this.title = title;
			this.note = note;
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
		public int getNid() {
			return nid;
		}
		public void setNid(int nid) {
			this.nid = nid;
		}
		@Override
		public String toString() {
			return "Post [title=" + title + ", note=" + note + ", nid=" + nid + "]";
		}
}
