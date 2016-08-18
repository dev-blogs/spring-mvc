package com.devblogs.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {
	private Long id;
	private String login;
	private String password;
	private String confirm;
	private String name;
	private String email;
	private Date registrationDate;
	private String description;
	private Set<Role> roles = new HashSet<Role>();

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@NotEmpty(message="{validation.login.NotEmpty.message}")
	@Size(min=5, max=40, message="{validation.login.Size.message}")
	@Column(name = "login")
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	@NotEmpty(message="{validation.password.NotEmpty.message}")
	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@NotEmpty(message="{validation.password.NotEmpty.message}")
	@Transient
	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	@NotEmpty(message="{validation.username.NotEmpty.message}")
	@Size(min=2, max=40, message="{validation.username.Size.message}")
	@Column(name = "user_name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	//@NotEmpty(message="{validation.email.NotEmpty.message}")
	@Pattern(regexp=".+@.+\\..+", message="{validation.login.email}")
	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "date_of_registration")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE })
	@JoinTable(name = "users_roles",
		joinColumns = {@JoinColumn(name = "users_id")},
		inverseJoinColumns = {@JoinColumn(name = "roles_id")}
	)
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	@Override
	public String toString() {
		return "user[id=" + this.id + ", login=" + this.login + ", name=" + this.name + ", email=" + this.email + ", registrationDate=" + this.registrationDate + ", description=" + this.description + "]";
	}
}