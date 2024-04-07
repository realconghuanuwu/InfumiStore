package entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "ChiTietGioHang", uniqueConstraints = @UniqueConstraint(columnNames = {"ma_gio_hang", "ma_san_pham"}))
public class ChiTietGioHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	
	@ManyToOne
	@JoinColumn(name = "ma_gio_hang", referencedColumnName = "id", nullable = false)
	private GioHang gioHang;
	
	@ManyToOne
	@JoinColumn(name = "ma_san_pham", referencedColumnName = "id", nullable = false)
	private SanPham sanPham;

	@Column(name = "so_luong")
	private Integer soLuong;
}
