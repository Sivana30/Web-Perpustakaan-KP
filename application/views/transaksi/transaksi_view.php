<div class="">
    <div class="page-title" style="padding: 8px">
        <div class="title_left">
            <h1><i class="fa fa-line-chart"></i>  Transaksi</h1>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>List Data <small>Transaksi peminjaman dan pengembalian</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                <!-- Data -->
                <?php if($total == 0): ?>
                    <div class="alert alert-danger">Tidak ada data</div>
                    <?php else: ?>
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h2 class="panel-title">Peminjaman</h2>
                        </div>
                        <div class="panel-body">
                            <table id="datatables" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Nama Peminjam</th>
                                        <th>Tgl Pinjam</th>
                                        <th>Jadwal Pengembalian</th>
                                        <th>Judul Buku</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php $no = 1;?>
                                <?php foreach ($pinjam as $pmn):?>
                                    <tr>
                                        <td><?php echo $no ?></td>
                                        <td><?php echo $pmn->ID_PINJAM ?></td>
                                        <td><a href="<?php echo base_url() ?>anggota/detail?idtf=<?php echo $pmn->ID_ANGGOTA ?>"><?php echo $pmn->ID_ANGGOTA ?></a></td>
                                        <td><?php $tgl = date_create($pmn->TGL_PINJAM);echo date_format($tgl,"D, d M Y"); ?></td>
                                        <td><?php $tgl = date_create($pmn->DEADLINE);echo date_format($tgl,"D, d M Y"); ?></td>
                                        <td><?php echo $pmn->TITLE ?></td>
                                    </tr>
                                    <?php $no++; ?>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            
                        </div>
                    </div>

                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h2 class="panel-title">Pengembalian</h2>
                        </div>
                        <div class="panel-body">
                            <table id="datatables" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Nama Peminjam</th>
                                        <th>Tgl Pinjam</th>
                                        <th>Tgl Kembali</th>
                                        <th>Judul Buku</th>
                                        <th>Denda</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php $no = 1;?>
                                <?php foreach ($kembali as $pmb):?>
                                    <tr>
                                        <td><?php echo $no ?></td>
                                        <td><?php echo $pmb->ID_PINJAM ?></td>
                                        <td><a href="<?php echo base_url() ?>anggota/detail?idtf=<?php echo $pmb->ID_ANGGOTA ?>"><?php echo $pmb->ID_ANGGOTA ?></a></td>
                                        <td><?php $tgl = date_create($pmb->TGL_PINJAM);echo date_format($tgl,"D, d M Y"); ?></td>
                                        <td><?php $tgl = date_create($pmb->TGL_KEMBALI);echo date_format($tgl,"D, d M Y"); ?></td>
                                        <td><?php echo $pmb->TITLE ?></td>
                                        <td><?php echo $pmb->DENDA ?></td>
                                    </tr>
                                    <?php $no++; ?>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            
                        </div>
                    </div>
                <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="detailModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-arrow-down"></i>  Pengembalian</h4>
            </div>
            <div class="modal-body" id="contents"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary active" data-dismiss="modal">Selesai</button>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url() ?>assets/vendors/jquery/dist/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $('#datatables').DataTable();
});
</script>