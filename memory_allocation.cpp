//
// Created by Edward Hyde on 2019-03-31.
//

#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <thread>
#include <chrono>

/*
        Program output:

        System page size: 4096 bytes
        Address of the region: 0x2007d0000 -- our address
        Contents of region: Hello world


        SETH:~ edwardhyde$ vmmap -pages 2771
        Process:         memory_allocation [2771]
        Path:            /Users/USER/memory_allocation
        Load Address:    0x1036a2000
        Identifier:      memory_allocation
        Version:         ???
        Code Type:       X86-64
        Parent Process:  clion [1636]

        Date/Time:       2019-03-31 16:21:59.726 +0300
        Launch Time:     2019-03-31 16:21:44.306 +0300
        OS Version:      Mac OS X 10.14.4 (18E226)
        Report Version:  7
        Analysis Tool:   /usr/bin/vmmap

        Physical footprint:         296K
        Physical footprint (peak):  296K
        ----

        Virtual Memory Map of process 2771 (memory_allocation)
        Output report format:  2.4  -- 64-bit process
        VM page size:  4096 bytes

        ==== Writable regions for process 2771
        REGION TYPE                      START - END             [ VSIZE  RSDNT  DIRTY   SWAP] PRT/MAX SHRMOD PURGE    REGION DETAIL
        __DATA                 00000001036a3000-00000001036a4000 [     1      1      1      0] rw-/rwx SM=COW          /Users/edwardhyde/cpp-learning/cmake-build-debug/memory_allocation
        Kernel Alloc Once      00000001036a5000-00000001036a7000 [     2      1      1      0] rw-/rwx SM=PRV
        MALLOC metadata        00000001036a8000-00000001036a9000 [     1      1      1      0] rw-/rwx SM=ZER
        MALLOC metadata        00000001036aa000-00000001036b0000 [     6      6      6      0] rw-/rwx SM=ZER
        MALLOC metadata        00000001036b2000-00000001036b8000 [     6      6      6      0] rw-/rwx SM=PRV
        __DATA                 00000001088aa000-00000001088af000 [     5      5      5      0] rw-/rwx SM=COW          /usr/lib/dyld
        __DATA                 00000001088af000-00000001088e3000 [    52      8      8      0] rw-/rwx SM=PRV          /usr/lib/dyld

        VM_ALLOCATE            00000002007d0000-00000002007d1000 [     1      1      1      0] rwx/rwx SM=PRV           <<<--------------------------------------- here is our allocation

        MALLOC_TINY            00007fecea400000-00007fecea500000 [   256      5      5      0] rw-/rwx SM=PRV          DefaultMallocZone_0x1036a7000
        MALLOC_SMALL           00007fecea800000-00007feceb000000 [  2048      3      3      0] rw-/rwx SM=PRV          DefaultMallocZone_0x1036a7000
        Stack                  00007ffeebd5e000-00007ffeec55e000 [  2048      4      4      0] rw-/rwx SM=PRV          thread 0
        __DATA                 00007fff8e938000-00007fff8e939000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/libSystem.B.dylib
        __DATA                 00007fff8e964000-00007fff8e96c000 [     8      8      3      0] rw-/rwx SM=COW          /usr/lib/libc++.1.dylib
        __DATA                 00007fff8e96c000-00007fff8e970000 [     4      4      1      0] rw-/rwx SM=COW          /usr/lib/libc++abi.dylib
        __DATA                 00007fff8ede0000-00007fff8ef6d000 [   397    180      5      0] rw-/rwx SM=COW          /usr/lib/libobjc.A.dylib
        __DATA                 00007fff8f1dc000-00007fff8f1dd000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libcache.dylib
        __DATA                 00007fff8f1dd000-00007fff8f1df000 [     2      2      0      0] rw-/rwx SM=COW          /usr/lib/system/libcommonCrypto.dylib
        __DATA                 00007fff8f1df000-00007fff8f1e1000 [     2      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libcompiler_rt.dylib
        __DATA                 00007fff8f1e1000-00007fff8f1e2000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libcopyfile.dylib
        __DATA                 00007fff8f1e2000-00007fff8f1eb000 [     9      8      1      0] rw-/rwx SM=COW          /usr/lib/system/libcorecrypto.dylib
        __DATA                 00007fff8f1f5000-00007fff8f20e000 [    25     14      3      0] rw-/rwx SM=COW          /usr/lib/system/libdispatch.dylib
        __DATA                 00007fff8f20e000-00007fff8f212000 [     4      4      2      0] rw-/rwx SM=COW          /usr/lib/system/libdyld.dylib
        __DATA                 00007fff8f212000-00007fff8f213000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libkeymgr.dylib
        __DATA                 00007fff8f214000-00007fff8f215000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libmacho.dylib
        __DATA                 00007fff8f215000-00007fff8f216000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libquarantine.dylib
        __DATA                 00007fff8f216000-00007fff8f217000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libremovefile.dylib
        __DATA                 00007fff8f217000-00007fff8f219000 [     2      2      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_asl.dylib
        __DATA                 00007fff8f219000-00007fff8f21a000 [     1      1      1      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_blocks.dylib
        __DATA                 00007fff8f21a000-00007fff8f223000 [     9      9      5      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_c.dylib
        __DATA                 00007fff8f223000-00007fff8f224000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_configuration.dylib
        __DATA                 00007fff8f224000-00007fff8f225000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_coreservices.dylib
        __DATA                 00007fff8f225000-00007fff8f228000 [     3      2      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_darwin.dylib
        __DATA                 00007fff8f228000-00007fff8f229000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_dnssd.dylib
        __DATA                 00007fff8f229000-00007fff8f22c000 [     3      3      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_info.dylib
        __DATA                 00007fff8f22c000-00007fff8f22f000 [     3      3      1      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_kernel.dylib
        __DATA                 00007fff8f22f000-00007fff8f230000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_m.dylib
        __DATA                 00007fff8f230000-00007fff8f233000 [     3      3      2      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_malloc.dylib
        __DATA                 00007fff8f233000-00007fff8f235000 [     2      2      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_networkextension.dylib
        __DATA                 00007fff8f235000-00007fff8f236000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_notify.dylib
        __DATA                 00007fff8f236000-00007fff8f237000 [     1      1      1      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_platform.dylib
        __DATA                 00007fff8f237000-00007fff8f239000 [     2      1      1      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_pthread.dylib
        __DATA                 00007fff8f239000-00007fff8f23a000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_sandbox.dylib
        __DATA                 00007fff8f23a000-00007fff8f23b000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_secinit.dylib
        __DATA                 00007fff8f23b000-00007fff8f23c000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_symptoms.dylib
        __DATA                 00007fff8f23c000-00007fff8f23e000 [     2      2      1      0] rw-/rwx SM=COW          /usr/lib/system/libsystem_trace.dylib
        __DATA                 00007fff8f23e000-00007fff8f23f000 [     1      1      0      0] rw-/rwx SM=COW          /usr/lib/system/libunwind.dylib
        __DATA                 00007fff8f23f000-00007fff8f246000 [     7      7      3      0] rw-/rwx SM=COW          /usr/lib/system/libxpc.dylib

        ==== Legend
        SM=sharing mode:
        COW=copy_on_write PRV=private NUL=empty ALI=aliased
        SHM=shared ZER=zero_filled S/A=shared_alias
        PURGE=purgeable mode:
        V=volatile N=nonvolatile E=empty   otherwise is unpurgeable

        ==== Summary for process 2771
        ReadOnly portion of Libraries: Total=233.1M resident=83.5M(36%) swapped_out_or_unallocated=149.6M(64%)
        Writable regions: Total=17.3M written=112K(1%) resident=140K(1%) swapped_out=0K(0%) unallocated=17.1M(99%)

        VIRTUAL   RESIDENT      DIRTY    SWAPPED   VOLATILE     NONVOL      EMPTY   REGION
        REGION TYPE                         PAGES      PAGES      PAGES      PAGES      PAGES      PAGES      PAGES    COUNT (non-coalesced)
        ===========                       =======   ========      =====    =======   ========     ======      =====  =======
        Kernel Alloc Once                       2          1          1          0          0          0          0        1
        MALLOC guard page                       4          0          0          0          0          0          0        4
        MALLOC metadata                        15         15         15          0          0          0          0        5
        MALLOC_SMALL                         2048          3          3          0          0          0          0        1         see MALLOC ZONE table below
                MALLOC_TINY                           256          5          5          0          0          0          0        1         see MALLOC ZONE table below
                STACK GUARD                         14336          0          0          0          0          0          0        1
        Stack                                2048          4          4          0          0          0          0        1

        VM_ALLOCATE                             1          1          1          0          0          0          0        1   <<<--------------------------------------- here is our allocation

        __DATA                                563        287         44          0          0          0          0       39
        __LINKEDIT                          56711      19440          0          0          0          0          0        3
        __TEXT                               2969       1935          0          0          0          0          0       39
        shared memory                           2          2          2          0          0          0          0        2
        ===========                       =======   ========      =====    =======   ========     ======      =====  =======
        TOTAL                               78955      21693         75          0          0          0          0       98

        VIRTUAL   RESIDENT      DIRTY    SWAPPED ALLOCATION      BYTES DIRTY+SWAP          REGION
        MALLOC ZONE                        PAGES      PAGES      PAGES      PAGES      COUNT  ALLOCATED  FRAG SIZE  % FRAG   COUNT
        ===========                      =======  =========  =========  =========  =========  =========  =========  ======  ======
        DefaultMallocZone_0x1036a7000       2304          8          8          0        158        17K        15K     47%       2


 */
int main() {
    auto pagesize = (size_t)getpagesize();

    printf("System page size: %zu bytes\n", pagesize);

    char * region = (char *)mmap(
            (void*) (pagesize * ((1 << 21) + 2000)),   // Map from the start of the 2^21th page = 2099152 = 0x2007D0 in hex expected address
            pagesize,
            PROT_READ|PROT_WRITE|PROT_EXEC,
            MAP_ANON|MAP_PRIVATE,
            0,
            0
    );
    if (region == MAP_FAILED) {
        perror("Could not mmap");
        return 1;
    }

    printf("Address of the region: %p\n", (void*)region);

    strcpy(region, "Hello world");

    printf("Contents of region: %s\n", region);

    std::this_thread::sleep_for(std::chrono::seconds(60));

    int unmap_result = munmap(region, pagesize);
    if (unmap_result != 0) {
        perror("Could not munmap");
        return 1;
    }

    return 0;
}