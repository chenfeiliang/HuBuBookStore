package com.cfl.dto;

import com.cfl.domain.User;

import javax.persistence.Entity;

@Entity
public class UserDTO extends User{
	private String passWordAgain;

	public String getPassWordAgain() {
		return passWordAgain;
	}

	public void setPassWordAgain(String passWordAgain) {
		this.passWordAgain = passWordAgain;
	}
}
