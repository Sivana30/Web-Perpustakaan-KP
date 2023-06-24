<?php $denda = 0; ?>
<div class="row">
    <div class="alert alert-danger text-center">
    	<p style="font-size:17px"><b>Kode Peminjaman :</b> <?php echo $detail->ID_PINJAM ?></p>
    </div>
</div>
<div class="row text-center">
	<div class="col-md-4 col-xs-4">
		<label>Nama Peminjam</label>
	    <p><?php echo $detail->FULL_NAME ?></p>
	</div>
	<div class="col-md-4 col-xs-4">
		<label>Tanggal Peminjaman</label>
	    <p><?php $tgl = date_create($detail->TGL_PINJAM);echo date_format($tgl,"D, d M Y"); ?></p>
	</div>
	<div class="col-md-4 col-xs-4">
		<label>Nama Petugas</label>
	    <p><?php echo $detail->FULLNAME ?></p>
	</div>
</div>
<div class="row">
    <hr>
    <h4 class="text-center">Daftar Buku. Kembali (<?php echo $status.'/'.$count ?>)</h4>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>No</th>
                <th>Judul Buku</th>
                <th>Kondisi</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
        <?php $no = 1; ?>
        <?php foreach($buku as $bk): ?>
            <tr>
                <th scope="row"><?php echo $no ?></th>
                <td><?php echo $bk->TITLE ?></td>
                <td><select id="kondisi<?=$no?>" tgr="<?=$no?>" status="<?=$bk->STATUS?>" deadline="<?=$detail->DEADLINE?>" class="btn btn-outline-primary">
                    <option value="Baik">Baik</option>
                    <option value="Rusak">Rusak</option>
                    <option value="Hilang">Hilang</option>
                </select></td>
                <td id="status<?=$no?>">
            <?php 
            $dl = strtotime($detail->DEADLINE);
            $now = time();
            if($bk->STATUS == 'Sudah Kembali'){
               echo 'Sudah kembali :';
            }else{
               if(strtotime(date("Y-m-d")) > $dl){
                   $diff = $now - $dl;
                   $denda = floor($diff / 86400)*$keterlambatan;
                   echo 'Denda Rp.'.$denda;
                }else if(strtotime(date("Y-m-d")) < $dl){
                   $diff = $dl - $now;
                   echo (floor($diff/86400)+1).' Hari lagi';
                }else{
                   echo 'Hari terakhir';
               }
            }
            ?>
            </td>
                <td>
                	<?php if($bk->STATUS == 'Belum Kembali'): ?>
                        <!-- BUTTON KEMBALI -->
                        <a href="<?php echo base_url() ?>pengembalian/kembali?id=<?php echo $bk->ID_DIPINJAM ?>&pnj=<?php echo $detail->ID_PINJAM ?>&denda=<?php echo $denda ?>&status=<?php echo $status ?>&count=<?php echo $count ?>&book=<?php echo $bk->ID_BUKU ?>" class="btn btn-info btn-xs" id="<?php echo $bk->ID_DIPINJAM ?>"><i class="fa fa-arrow-right"></i>  Sudah Kembali</a>
                    <?php else: ?>
                        <?php $tg = date_create($bk->TGL_KEMBALI);echo date_format($tg,"d M Y");?>
                    <?php endif; ?>
                </td>
            </tr>
    <script>
            $("#kondisi<?=$no?>").change(function(){
            var kon = $(this).val();
            var dat = $(this).attr('deadline');
            var bk = $(this).attr('status');
            var tgr = $(this).attr('tgr');
            $.ajax({
                url:"<?php echo base_url() ?>pengembalian/denda",
                type: "POST",
                data: {"kondisi" : kon,"deadline": dat,'status': bk},
                cache: false,
                success: function(huh){
                    $(`#status${tgr}`).html(huh);
                }
            })
        });
    </script>
            <?php $no++; ?>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>


