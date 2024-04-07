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
@Table(name = "PhanLoai")
public class PhanLoai {

    @Id
    @Column(name = "id", length = 10)
    private String id;

    @Column(name = "ten_phan_loai", length = 50)
    private String tenPhanLoai;

}
