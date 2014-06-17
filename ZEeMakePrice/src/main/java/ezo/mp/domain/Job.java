package ezo.mp.domain;

public class Job {
	private String jobcode;
	private String job;
	public Job() {
		// TODO Auto-generated constructor stub
	}
	public String getJobcode() {
		return jobcode;
	}
	public void setJobcode(String jobcode) {
		this.jobcode = jobcode;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "Job [jobcode=" + jobcode + ", job=" + job + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((job == null) ? 0 : job.hashCode());
		result = prime * result + ((jobcode == null) ? 0 : jobcode.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Job other = (Job) obj;
		if (job == null) {
			if (other.job != null)
				return false;
		} else if (!job.equals(other.job))
			return false;
		if (jobcode == null) {
			if (other.jobcode != null)
				return false;
		} else if (!jobcode.equals(other.jobcode))
			return false;
		return true;
	}
}
