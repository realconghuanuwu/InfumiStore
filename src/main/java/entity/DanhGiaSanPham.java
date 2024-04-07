package entity;

import java.time.LocalDate;

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
@Table(name = "DanhGiaSanPham")
public class DanhGiaSanPham {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "like_numbers")
    private Integer likeNumbers;

    @Column(name = "review_date")
    private LocalDate reviewDate;

    @Column(name = "comment", length = 200)
    private String comment;

    @Column(name = "image", length = 10)
    private String image;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    private SanPham sanPham;
}
