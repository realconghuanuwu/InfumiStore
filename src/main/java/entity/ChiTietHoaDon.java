package entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "ChiTietHoaDon")
public class ChiTietHoaDon {

    @Id
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ma_hoa_don", referencedColumnName = "id", nullable = false)
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "ma_san_pham", referencedColumnName = "id", nullable = false)
    private SanPham sanPham;

    @Column(name = "so_luong")
    private Integer soLuong;

    // constructors, getters, and setters
}
