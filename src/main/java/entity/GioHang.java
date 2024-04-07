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
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "GioHang")
public class GioHang {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ma_khach_hang", referencedColumnName = "id", nullable = false)
    private KhachHang khachHang;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;
    
    @OneToMany(mappedBy = "gioHang")
    List<ChiTietGioHang> chiTietGioHangs;
}
