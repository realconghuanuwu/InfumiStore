package entity;

import java.time.LocalDate;

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
@Table(name = "NhanVien")
public class NhanVien {
	
	@Id
    @Column(name = "id", length = 50)
    private String id;

    @Column(name = "ten", length = 50, nullable = false)
    private String ten;

    @Column(name = "ho_va_ten_lot", length = 70, nullable = false)
    private String hoVaTenLot;

    @Column(name = "mat_khau", length = 50, nullable = false)
    private String matKhau;

    @Column(name = "email", length = 50)
    private String email;

    @Column(name = "so_dien_thoai", length = 15)
    private String soDienThoai;

    @Column(name = "vai_tro", nullable = false)
    private int vaiTro;

    @Column(name = "ngay_sinh")
    private LocalDate ngaySinh;

    @Column(name = "dia_chi", length = 150)
    private String diaChi;

    @Column(name = "gioi_tinh")
    private boolean gioiTinh;
}
