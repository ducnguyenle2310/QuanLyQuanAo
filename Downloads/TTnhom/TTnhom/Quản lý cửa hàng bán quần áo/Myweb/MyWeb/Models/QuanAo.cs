//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class QuanAo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QuanAo()
        {
            this.ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }
    
        public int MaQuanAo { get; set; }
        public string TenQuanAo { get; set; }
        public Nullable<decimal> GiaBan { get; set; }
        public string Anh { get; set; }
        public Nullable<System.DateTime> NgayNhap { get; set; }
        public Nullable<int> SoLuongTon { get; set; }
        public Nullable<int> MaLoai { get; set; }
        public Nullable<int> MaNCC { get; set; }
        public Nullable<int> MaNSX { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual LoaiQuanAo LoaiQuanAo { get; set; }
        public virtual NhaCungCap NhaCungCap { get; set; }
        public virtual NhaSanXuat NhaSanXuat { get; set; }
    }
}
