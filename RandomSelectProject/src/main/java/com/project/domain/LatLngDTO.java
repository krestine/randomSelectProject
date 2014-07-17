package com.project.domain;

public class LatLngDTO {
	private double minLat;
	private double maxLat;
	private double minLng;
	private double maxLng;
	public double getMinLat() {
		return minLat;
	}
	public void setMinLat(double minLat) {
		this.minLat = minLat;
	}
	public double getMaxLat() {
		return maxLat;
	}
	public void setMaxLat(double maxLat) {
		this.maxLat = maxLat;
	}
	public double getMinLng() {
		return minLng;
	}
	public void setMinLng(double minLng) {
		this.minLng = minLng;
	}
	public double getMaxLng() {
		return maxLng;
	}
	public void setMaxLng(double maxLng) {
		this.maxLng = maxLng;
	}
	@Override
	public String toString() {
		return "LatLngDTO [minLat=" + minLat + ", maxLat=" + maxLat
				+ ", minLng=" + minLng + ", maxLng=" + maxLng + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(maxLat);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(maxLng);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(minLat);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(minLng);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		LatLngDTO other = (LatLngDTO) obj;
		if (Double.doubleToLongBits(maxLat) != Double
				.doubleToLongBits(other.maxLat))
			return false;
		if (Double.doubleToLongBits(maxLng) != Double
				.doubleToLongBits(other.maxLng))
			return false;
		if (Double.doubleToLongBits(minLat) != Double
				.doubleToLongBits(other.minLat))
			return false;
		if (Double.doubleToLongBits(minLng) != Double
				.doubleToLongBits(other.minLng))
			return false;
		return true;
	}
}
