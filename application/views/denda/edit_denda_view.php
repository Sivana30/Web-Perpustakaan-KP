<div class="">
    <div class="page-title" style="padding: 8px">
        <div class="title_left">
            <h1><i class="fa fa-money"></i>  Edit Denda</h1>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Perbarui data Denda</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <?php
                            $announce = $this->session->flashdata('announce');
                            if(!empty($announce)){
                                if($announce == 'Berhasil menyimpan data'){
                                    echo '
                                        <div class="alert alert-success">
                                        '.$announce.'
                                        </div>
                                    ';
                                }else{
                                    echo '
                                        <div class="alert alert-danger">
                                        '.$announce.'
                                        </div>
                                    ';
                                }
                            }
                        ?>
                            <form method="post" action="<?php echo base_url() ?>denda/submits" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                <input type="hidden" readonly name="id" value="<?php echo $detail->ID_DENDA?>">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="keterangan">keterangan Denda
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="keterangan" name="keterangan" value="<?=$detail->KETERANGAN?>" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="biaya">biaya Denda
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" id="biaya" name="biaya" value="<?=$detail->BIAYA?>" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <a class="btn btn-primary active" href="<?php echo base_url() ?>denda">Kembali</a>
                                        <input type="submit" class="btn btn-success" name="submit" value="Simpan">
                                    </div>
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
