package com.devblogs.model;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "items")
public class Item {
	private Long id;
	private String name;
	private Double price;
	private String description;
	private Set<Provider> providers = new HashSet<Provider>();
	private Order order;
	private Category category;
	private Warehouse warehouse;

	public Item() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@NotEmpty(message="{validation.item.name.NotEmpty.message}")
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull(message="{validation.item.price.NotEmpty.message}")
	@Column(name = "price")
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	
	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.DETACH})
    @JoinTable(name = "items_providers",
	    joinColumns={@JoinColumn(name = "item_id")},
	    inverseJoinColumns={@JoinColumn(name = "provider_id")})
	public Set<Provider> getProviders() {
		return providers;
	}

	public void addProvider(Provider provider) {
		this.providers.add(provider);
	}
	
	public void setProviders(Set<Provider> providers) {
		this.providers = providers;
	}
	
	@OneToOne
	@JoinColumn(name = "order_id")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@ManyToOne
	@JoinColumn(name = "category_id")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne
	@JoinColumn(name = "warehouse_id")
	public Warehouse getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		Item that = (Item) obj;
		if (!name.equals(that.name))
			return false;

		return true;
	}

	@Override
	public String toString() {
		return "[id=" + this.id + ", name=" + this.name + ", price=" + this.price + "]";
	}
}