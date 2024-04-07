package entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "NhaCungCap")
public class NhaCungCap {
	@Id
	@Column(name = "id", length = 10)
	private String id;

	@Column(name = "full_name", length = 150)
	private String fullName;

	@Column(name = "short_name", length = 50)
	private String shortName;

	@Column(name = "email", length = 100)
	private String email;

	@Column(name = "so_dien_thoai", length = 15)
	private String soDienThoai;

	@Column(name = "dia_chi", length = 200)
	private String diaChi;

	@Column(name = "ma_so_thue", length = 50)
	private String maSoThue;
}
