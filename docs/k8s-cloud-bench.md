# K8S Benchmark

## Setup

```sh
cd infra/stacks/cloud-disk-bench
terraform init
terraform plan # Make sure it all looks ok
terraform apply
```

## Disk Benchmarks

- Kubestr at `apps/kubestr`

### Civo

```sh
cd /workspace/toolbox/apps/kubestr
./kubestr fio -s civo-volume
```

*Results:*
```text
PVC created kubestr-fio-pvc-kwmgq
Pod created kubestr-fio-pod-fdfh8
Running FIO test (default-fio) on StorageClass (civo-volume) with a PVC of Size (100Gi)
Elapsed time- 1m15.518424213s
FIO test results:
  
FIO version - fio-3.30
Global options - ioengine=libaio verify=0 direct=1 gtod_reduce=1

JobName: read_iops
  blocksize=4K filesize=2G iodepth=64 rw=randread
read:
  IOPS=8648.512695 BW(KiB/s)=34610
  iops: min=5584 max=10572 avg=8678.266602
  bw(KiB/s): min=22336 max=42288 avg=34713.433594

JobName: write_iops
  blocksize=4K filesize=2G iodepth=64 rw=randwrite
write:
  IOPS=7751.394043 BW(KiB/s)=31022
  iops: min=5480 max=9020 avg=7778.666504
  bw(KiB/s): min=21920 max=36080 avg=31115.000000

JobName: read_bw
  blocksize=128K filesize=2G iodepth=64 rw=randread
read:
  IOPS=8203.345703 BW(KiB/s)=1050563
  iops: min=5536 max=9880 avg=8231.599609
  bw(KiB/s): min=708608 max=1264731 avg=1053650.250000

JobName: write_bw
  blocksize=128k filesize=2G iodepth=64 rw=randwrite
write:
  IOPS=7947.864746 BW(KiB/s)=1017862
  iops: min=5959 max=9024 avg=7974.266602
  bw(KiB/s): min=762869 max=1155072 avg=1020723.437500

Disk stats (read/write):
  sda: ios=276447/258401 merge=1311/1408 ticks=2037164/1981385 in_queue=2931856, util=98.636230%
  -  OK
```

### EKS

```text
gitpod /workspace/toolbox/apps/kubestr (cloud-disk-bench) $ ./kubestr fio -s gp2
PVC created kubestr-fio-pvc-p2sfv
Pod created kubestr-fio-pod-pskxf
Running FIO test (default-fio) on StorageClass (gp2) with a PVC of Size (100Gi)
Elapsed time- 55.166581659s
FIO test results:
  
FIO version - fio-3.30
Global options - ioengine=libaio verify=0 direct=1 gtod_reduce=1

JobName: read_iops
  blocksize=4K filesize=2G iodepth=64 rw=randread
read:
  IOPS=691.434265 BW(KiB/s)=2782
  iops: min=156 max=1692 avg=692.333313
  bw(KiB/s): min=624 max=6768 avg=2769.933350

JobName: write_iops
  blocksize=4K filesize=2G iodepth=64 rw=randwrite
write:
  IOPS=482.692322 BW(KiB/s)=1947
  iops: min=62 max=1270 avg=481.066681
  bw(KiB/s): min=248 max=5080 avg=1924.599976

JobName: read_bw
  blocksize=128K filesize=2G iodepth=64 rw=randread
read:
  IOPS=583.372009 BW(KiB/s)=75206
  iops: min=389 max=866 avg=584.299988
  bw(KiB/s): min=49876 max=110848 avg=74793.203125

JobName: write_bw
  blocksize=128k filesize=2G iodepth=64 rw=randwrite
write:
  IOPS=343.612915 BW(KiB/s)=44518
  iops: min=104 max=555 avg=344.000000
  bw(KiB/s): min=13312 max=71054 avg=44054.101562

Disk stats (read/write):
  nvme1n1: ios=21943/15505 merge=0/330 ticks=526747/410721 in_queue=863052, util=99.596611%
  -  OK
```