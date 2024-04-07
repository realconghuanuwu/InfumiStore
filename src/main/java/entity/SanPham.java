package entity;
import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "SanPham")
public class SanPham {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tieu_de", nullable = false)
    private String tieuDe;

    @ManyToOne
    @JoinColumn(name = "tac_gia", nullable = false)
    private TacGia tacGia;

    @Column(name = "don_gia", nullable = false)
    private Double donGia;

    @Column(name = "nam_xuat_ban")
    private Integer namXuatBan;

    @Column(name = "mo_ta", columnDefinition = "TEXT")
    private String moTa;

    @Column(name = "kich_thuoc")
    private String kichThuoc;

    @Column(name = "so_trang")
    private Integer soTrang;

    @Column(name = "giam_gia")
    private Double giamGia;

    @Column(name = "ngon_ngu")
    private String ngonNgu;

    @Column(name = "kieu_bia")
    private String kieuBia;

    @Column(name = "so_luong")
    private Integer soLuong;
    
    @Column(name = "can_nang")
    private Float canNang;
    
    @Column(name = "do_tuoi")
    private Integer doTuoi;

    @Column(name = "ngay_cap_nhat_moi_nhat")
    @Temporal(TemporalType.DATE)
    private LocalDate ngayCapNhatMoiNhat;

    @Column(name = "ngay_nhap", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate ngayNhap;

    @Column(name = "nguoi_dich")
    private String nguoiDich;

    @ManyToOne
    @JoinColumn(name = "phan_loai", nullable = false)
    private PhanLoai phanLoai;

    @ManyToOne
    @JoinColumn(name = "nha_xuat_ban")
    private NhaXuatBan nhaXuatBan;

    @ManyToOne
    @JoinColumn(name = "the_loai")
    private TheLoai theLoai;
    
    @ManyToOne
    @JoinColumn(name = "nguoi_nhap")
    private NhanVien nguoiNhap;
    
    @ManyToOne
    @JoinColumn(name = "nha_cung_cap")
    private NhaCungCap nhaCungCap;

    @Column(name = "trang_thai")
    private Boolean trangThai;
    
    @OneToMany(mappedBy = "sanPham")
    List<AnhSanPham> anhSanPhams;
    
    @OneToMany(mappedBy = "sanPham")
    List<ChiTietHoaDon> chiTietHoaDons;
    
}
