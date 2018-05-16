L 1 "../ff.c"
N/*----------------------------------------------------------------------------/
N/  FatFs - FAT file system module  R0.09b                 (C)ChaN, 2013
N/-----------------------------------------------------------------------------/
N/ FatFs module is a generic FAT file system module for small embedded systems.
N/ This is a free software that opened for education, research and commercial
N/ developments under license policy of following terms.
N/
N/  Copyright (C) 2013, ChaN, all right reserved.
N/
N/ * The FatFs module is a free software and there is NO WARRANTY.
N/ * No restriction on use. You can use, modify and redistribute it for
N/   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
N/ * Redistributions of source code must retain the above copyright notice.
N/
N/-----------------------------------------------------------------------------/
N/ Feb 26,'06 R0.00  Prototype.
N/
N/ Apr 29,'06 R0.01  First stable version.
N/
N/ Jun 01,'06 R0.02  Added FAT12 support.
N/                   Removed unbuffered mode.
N/                   Fixed a problem on small (<32M) partition.
N/ Jun 10,'06 R0.02a Added a configuration option (_FS_MINIMUM).
N/
N/ Sep 22,'06 R0.03  Added f_rename().
N/                   Changed option _FS_MINIMUM to _FS_MINIMIZE.
N/ Dec 11,'06 R0.03a Improved cluster scan algorithm to write files fast.
N/                   Fixed f_mkdir() creates incorrect directory on FAT32.
N/
N/ Feb 04,'07 R0.04  Supported multiple drive system.
N/                   Changed some interfaces for multiple drive system.
N/                   Changed f_mountdrv() to f_mount().
N/                   Added f_mkfs().
N/ Apr 01,'07 R0.04a Supported multiple partitions on a physical drive.
N/                   Added a capability of extending file size to f_lseek().
N/                   Added minimization level 3.
N/                   Fixed an endian sensitive code in f_mkfs().
N/ May 05,'07 R0.04b Added a configuration option _USE_NTFLAG.
N/                   Added FSInfo support.
N/                   Fixed DBCS name can result FR_INVALID_NAME.
N/                   Fixed short seek (<= csize) collapses the file object.
N/
N/ Aug 25,'07 R0.05  Changed arguments of f_read(), f_write() and f_mkfs().
N/                   Fixed f_mkfs() on FAT32 creates incorrect FSInfo.
N/                   Fixed f_mkdir() on FAT32 creates incorrect directory.
N/ Feb 03,'08 R0.05a Added f_truncate() and f_utime().
N/                   Fixed off by one error at FAT sub-type determination.
N/                   Fixed btr in f_read() can be mistruncated.
N/                   Fixed cached sector is not flushed when create and close without write.
N/
N/ Apr 01,'08 R0.06  Added fputc(), fputs(), fprintf() and fgets().
N/                   Improved performance of f_lseek() on moving to the same or following cluster.
N/
N/ Apr 01,'09 R0.07  Merged Tiny-FatFs as a configuration option. (_FS_TINY)
N/                   Added long file name feature.
N/                   Added multiple code page feature.
N/                   Added re-entrancy for multitask operation.
N/                   Added auto cluster size selection to f_mkfs().
N/                   Added rewind option to f_readdir().
N/                   Changed result code of critical errors.
N/                   Renamed string functions to avoid name collision.
N/ Apr 14,'09 R0.07a Separated out OS dependent code on reentrant cfg.
N/                   Added multiple sector size feature.
N/ Jun 21,'09 R0.07c Fixed f_unlink() can return FR_OK on error.
N/                   Fixed wrong cache control in f_lseek().
N/                   Added relative path feature.
N/                   Added f_chdir() and f_chdrive().
N/                   Added proper case conversion to extended char.
N/ Nov 03,'09 R0.07e Separated out configuration options from ff.h to ffconf.h.
N/                   Fixed f_unlink() fails to remove a sub-dir on _FS_RPATH.
N/                   Fixed name matching error on the 13 char boundary.
N/                   Added a configuration option, _LFN_UNICODE.
N/                   Changed f_readdir() to return the SFN with always upper case on non-LFN cfg.
N/
N/ May 15,'10 R0.08  Added a memory configuration option. (_USE_LFN = 3)
N/                   Added file lock feature. (_FS_SHARE)
N/                   Added fast seek feature. (_USE_FASTSEEK)
N/                   Changed some types on the API, XCHAR->TCHAR.
N/                   Changed fname member in the FILINFO structure on Unicode cfg.
N/                   String functions support UTF-8 encoding files on Unicode cfg.
N/ Aug 16,'10 R0.08a Added f_getcwd(). (_FS_RPATH = 2)
N/                   Added sector erase feature. (_USE_ERASE)
N/                   Moved file lock semaphore table from fs object to the bss.
N/                   Fixed a wrong directory entry is created on non-LFN cfg when the given name contains ';'.
N/                   Fixed f_mkfs() creates wrong FAT32 volume.
N/ Jan 15,'11 R0.08b Fast seek feature is also applied to f_read() and f_write().
N/                   f_lseek() reports required table size on creating CLMP.
N/                   Extended format syntax of f_printf function.
N/                   Ignores duplicated directory separators in given path name.
N/
N/ Sep 06,'11 R0.09  f_mkfs() supports multiple partition to finish the multiple partition feature.
N/                   Added f_fdisk(). (_MULTI_PARTITION = 2)
N/ Aug 27,'12 R0.09a Fixed assertion failure due to OS/2 EA on FAT12/16 volume.
N/                   Changed f_open() and f_opendir reject null object pointer to avoid crash.
N/                   Changed option name _FS_SHARE to _FS_LOCK.
N/ Jan 24,'13 R0.09b Added f_setlabel() and f_getlabel(). (_USE_LABEL = 1)
N/---------------------------------------------------------------------------*/
N
N#include "ff.h"         /* FatFs configurations and declarations */
L 1 "..\ff.h" 1
N/*---------------------------------------------------------------------------/
N/  FatFs - FAT file system module include file  R0.09b    (C)ChaN, 2013
N/----------------------------------------------------------------------------/
N/ FatFs module is a generic FAT file system module for small embedded systems.
N/ This is a free software that opened for education, research and commercial
N/ developments under license policy of following terms.
N/
N/  Copyright (C) 2013, ChaN, all right reserved.
N/
N/ * The FatFs module is a free software and there is NO WARRANTY.
N/ * No restriction on use. You can use, modify and redistribute it for
N/   personal, non-profit or commercial product UNDER YOUR RESPONSIBILITY.
N/ * Redistributions of source code must retain the above copyright notice.
N/
N/----------------------------------------------------------------------------*/
N
N#ifndef _FATFS
N#define _FATFS  82786   /* Revision ID */
N
N#ifdef __cplusplus
Sextern "C" {
N#endif
N
N#include "integer.h"    /* Basic integer types */
L 1 "..\integer.h" 1
N/*-------------------------------------------*/
N/* Integer type definitions for FatFs module */
N/*-------------------------------------------*/
N
N#ifndef _INTEGER
N#define _INTEGER
N
N#ifdef _WIN32   /* FatFs development platform */
S
S#include <windows.h>
S#include <tchar.h>
S
N#else           /* Embedded platform */
N
N/* These types must be 16-bit, 32-bit or larger integer */
Ntypedef int             INT;
Ntypedef unsigned int    UINT;
N
N/* These types must be 8-bit integer */
Ntypedef char            CHAR;
Ntypedef unsigned char   UCHAR;
Ntypedef unsigned char   BYTE;
N
N/* These types must be 16-bit integer */
Ntypedef short           SHORT;
Ntypedef unsigned short  USHORT;
Ntypedef unsigned short  WORD;
Ntypedef unsigned short  WCHAR;
N
N/* These types must be 32-bit integer */
Ntypedef long            LONG;
Ntypedef unsigned long   ULONG;
Ntypedef unsigned long   DWORD;
N
N/* Boolean type */
N//typedef enum { FALSE = 0, TRUE } BOOL;
N
N#endif
N
N#endif
L 25 "..\ff.h" 2
N#include "ffconf.h"     /* FatFs configuration options */
L 1 "..\ffconf.h" 1
N/*---------------------------------------------------------------------------/
N/  FatFs - FAT file system module configuration file  R0.09b (C)ChaN, 2013
N/----------------------------------------------------------------------------/
N/
N/ CAUTION! Do not forget to make clean the project after any changes to
N/ the configuration options.
N/
N/----------------------------------------------------------------------------*/
N#ifndef _FFCONF
N#define _FFCONF 82786   /* Revision ID */
N
N
N/*---------------------------------------------------------------------------/
N/ Functions and Buffer Configurations
N/----------------------------------------------------------------------------*/
N
N#define _FS_TINY        0   /* 0:Normal or 1:Tiny */
N/* When _FS_TINY is set to 1, FatFs uses the sector buffer in the file system
N/  object instead of the sector buffer in the individual file object for file
N/  data transfer. This reduces memory consumption 512 bytes each file object. */
N
N
N#define _FS_READONLY    0   /* 0:Read/Write or 1:Read only */
N/* Setting _FS_READONLY to 1 defines read only configuration. This removes
N/  writing functions, f_write, f_sync, f_unlink, f_mkdir, f_chmod, f_rename,
N/  f_truncate and useless f_getfree. */
N
N
N#define _FS_MINIMIZE    0   /* 0 to 3 */
N/* The _FS_MINIMIZE option defines minimization level to remove some functions.
N/
N/   0: Full function.
N/   1: f_stat, f_getfree, f_unlink, f_mkdir, f_chmod, f_truncate and f_rename
N/      are removed.
N/   2: f_opendir and f_readdir are removed in addition to 1.
N/   3: f_lseek is removed in addition to 2. */
N
N
N#define _USE_STRFUNC    1   /* 0:Disable or 1-2:Enable */
N/* To enable string functions, set _USE_STRFUNC to 1 or 2. */
N
N
N#define _USE_MKFS       0   /* 0:Disable or 1:Enable */
N/* To enable f_mkfs function, set _USE_MKFS to 1 and set _FS_READONLY to 0 */
N
N
N#define _USE_FASTSEEK   0   /* 0:Disable or 1:Enable */
N/* To enable fast seek feature, set _USE_FASTSEEK to 1. */
N
N
N#define _USE_LABEL      0   /* 0:Disable or 1:Enable */
N/* To enable volume label functions, set _USE_LAVEL to 1 */
N
N
N#define _USE_FORWARD    0   /* 0:Disable or 1:Enable */
N/* To enable f_forward function, set _USE_FORWARD to 1 and set _FS_TINY to 1. */
N
N
N/*---------------------------------------------------------------------------/
N/ Locale and Namespace Configurations
N/----------------------------------------------------------------------------*/
N
N#define _CODE_PAGE  932
N/* The _CODE_PAGE specifies the OEM code page to be used on the target system.
N/  Incorrect setting of the code page can cause a file open failure.
N/
N/   932  - Japanese Shift-JIS (DBCS, OEM, Windows)
N/   936  - Simplified Chinese GBK (DBCS, OEM, Windows)
N/   949  - Korean (DBCS, OEM, Windows)
N/   950  - Traditional Chinese Big5 (DBCS, OEM, Windows)
N/   1250 - Central Europe (Windows)
N/   1251 - Cyrillic (Windows)
N/   1252 - Latin 1 (Windows)
N/   1253 - Greek (Windows)
N/   1254 - Turkish (Windows)
N/   1255 - Hebrew (Windows)
N/   1256 - Arabic (Windows)
N/   1257 - Baltic (Windows)
N/   1258 - Vietnam (OEM, Windows)
N/   437  - U.S. (OEM)
N/   720  - Arabic (OEM)
N/   737  - Greek (OEM)
N/   775  - Baltic (OEM)
N/   850  - Multilingual Latin 1 (OEM)
N/   858  - Multilingual Latin 1 + Euro (OEM)
N/   852  - Latin 2 (OEM)
N/   855  - Cyrillic (OEM)
N/   866  - Russian (OEM)
N/   857  - Turkish (OEM)
N/   862  - Hebrew (OEM)
N/   874  - Thai (OEM, Windows)
N/   1    - ASCII only (Valid for non LFN cfg.)
N*/
N
N#ifdef ENABLE_LFN
S#define _USE_LFN    1       /* 0 to 3 */
N#else
N#define _USE_LFN    0       /* 0 to 3 */
N#endif
N#define _MAX_LFN    255     /* Maximum LFN length to handle (12 to 255) */
N/* The _USE_LFN option switches the LFN support.
N/
N/   0: Disable LFN feature. _MAX_LFN and _LFN_UNICODE have no effect.
N/   1: Enable LFN with static working buffer on the BSS. Always NOT reentrant.
N/   2: Enable LFN with dynamic working buffer on the STACK.
N/   3: Enable LFN with dynamic working buffer on the HEAP.
N/
N/  The LFN working buffer occupies (_MAX_LFN + 1) * 2 bytes. To enable LFN,
N/  Unicode handling functions ff_convert() and ff_wtoupper() must be added
N/  to the project. When enable to use heap, memory control functions
N/  ff_memalloc() and ff_memfree() must be added to the project. */
N
N
N#define _LFN_UNICODE    0   /* 0:ANSI/OEM or 1:Unicode */
N/* To switch the character code set on FatFs API to Unicode,
N/  enable LFN feature and set _LFN_UNICODE to 1. */
N
N
N#define _FS_RPATH       0   /* 0 to 2 */
N/* The _FS_RPATH option configures relative path feature.
N/
N/   0: Disable relative path feature and remove related functions.
N/   1: Enable relative path. f_chdrive() and f_chdir() are available.
N/   2: f_getcwd() is available in addition to 1.
N/
N/  Note that output of the f_readdir fnction is affected by this option. */
N
N
N/*---------------------------------------------------------------------------/
N/ Physical Drive Configurations
N/----------------------------------------------------------------------------*/
N
N#define _VOLUMES    1
N/* Number of volumes (logical drives) to be used. */
N
N
N#define _MAX_SS     512     /* 512, 1024, 2048 or 4096 */
N/* Maximum sector size to be handled.
N/  Always set 512 for memory card and hard disk but a larger value may be
N/  required for on-board flash memory, floppy disk and optical disk.
N/  When _MAX_SS is larger than 512, it configures FatFs to variable sector size
N/  and GET_SECTOR_SIZE command must be implememted to the disk_ioctl function. */
N
N
N#define _MULTI_PARTITION    0   /* 0:Single partition, 1:Enable multiple partition */
N/* When set to 0, each volume is bound to the same physical drive number and
N/ it can mount only first primaly partition. When it is set to 1, each volume
N/ is tied to the partitions listed in VolToPart[]. */
N
N
N#define _USE_ERASE  0   /* 0:Disable or 1:Enable */
N/* To enable sector erase feature, set _USE_ERASE to 1. CTRL_ERASE_SECTOR command
N/  should be added to the disk_ioctl functio. */
N
N
N
N/*---------------------------------------------------------------------------/
N/ System Configurations
N/----------------------------------------------------------------------------*/
N
N#define _WORD_ACCESS    0   /* 0 or 1 */
N/* Set 0 first and it is always compatible with all platforms. The _WORD_ACCESS
N/  option defines which access method is used to the word data on the FAT volume.
N/
N/   0: Byte-by-byte access.
N/   1: Word access. Do not choose this unless following condition is met.
N/
N/  When the byte order on the memory is big-endian or address miss-aligned word
N/  access results incorrect behavior, the _WORD_ACCESS must be set to 0.
N/  If it is not the case, the value can also be set to 1 to improve the
N/  performance and code size.
N*/
N
N
N/* A header file that defines sync object types on the O/S, such as
N/  windows.h, ucos_ii.h and semphr.h, must be included prior to ff.h. */
N
N#define _FS_REENTRANT   0       /* 0:Disable or 1:Enable */
N#define _FS_TIMEOUT     1000    /* Timeout period in unit of time ticks */
N#define _SYNC_t         HANDLE  /* O/S dependent type of sync object. e.g. HANDLE, OS_EVENT*, ID and etc.. */
N
N/* The _FS_REENTRANT option switches the reentrancy (thread safe) of the FatFs module.
N/
N/   0: Disable reentrancy. _SYNC_t and _FS_TIMEOUT have no effect.
N/   1: Enable reentrancy. Also user provided synchronization handlers,
N/      ff_req_grant, ff_rel_grant, ff_del_syncobj and ff_cre_syncobj
N/      function must be added to the project. */
N
N
N#define _FS_LOCK    0   /* 0:Disable or >=1:Enable */
N/* To enable file lock control feature, set _FS_LOCK to 1 or greater.
N   The value defines how many files can be opened simultaneously. */
N
N
N#endif /* _FFCONFIG */
L 26 "..\ff.h" 2
N
N#if _FATFS != _FFCONF
X#if 82786 != 82786
S#error Wrong configuration file (ffconf.h).
N#endif
N
N
N
N/* Definitions of volume management */
N
N#if _MULTI_PARTITION        /* Multiple partition configuration */
X#if 0         
Stypedef struct {
S    BYTE pd;    /* Physical drive number */
S    BYTE pt;    /* Partition: 0:Auto detect, 1-4:Forced partition) */
S} PARTITION;
Sextern PARTITION VolToPart[];   /* Volume - Partition resolution table */
S#define LD2PD(vol) (VolToPart[vol].pd)  /* Get physical drive number */
S#define LD2PT(vol) (VolToPart[vol].pt)  /* Get partition index */
S
N#else                           /* Single partition configuration */
N#define LD2PD(vol) (BYTE)(vol)  /* Each logical drive is bound to the same physical drive number */
N#define LD2PT(vol) 0            /* Always mounts the 1st partition or in SFD */
N
N#endif
N
N
N
N/* Type of path name strings on FatFs API */
N
N#if _LFN_UNICODE            /* Unicode string */
X#if 0             
S#if !_USE_LFN
S#error _LFN_UNICODE must be 0 in non-LFN cfg.
S#endif
S#ifndef _INC_TCHAR
Stypedef WCHAR TCHAR;
S#define _T(x) L ## x
S#define _TEXT(x) L ## x
S#endif
S
N#else                       /* ANSI/OEM string */
N#ifndef _INC_TCHAR
Ntypedef char TCHAR;
N#define _T(x) x
N#define _TEXT(x) x
N#endif
N
N#endif
N
N
N
N/* File system object structure (FATFS) */
N
Ntypedef struct {
N    BYTE    fs_type;        /* FAT sub-type (0:Not mounted) */
N    BYTE    drv;            /* Physical drive number */
N    BYTE    csize;          /* Sectors per cluster (1,2,4...128) */
N    BYTE    n_fats;         /* Number of FAT copies (1,2) */
N    BYTE    wflag;          /* win[] dirty flag (1:must be written back) */
N    BYTE    fsi_flag;       /* fsinfo dirty flag (1:must be written back) */
N    WORD    id;             /* File system mount ID */
N    WORD    n_rootdir;      /* Number of root directory entries (FAT12/16) */
N#if _MAX_SS != 512
X#if 512 != 512
S    WORD    ssize;          /* Bytes per sector (512, 1024, 2048 or 4096) */
N#endif
N#if _FS_REENTRANT
X#if 0
S    _SYNC_t sobj;           /* Identifier of sync object */
N#endif
N#if !_FS_READONLY
X#if !0
N    DWORD   last_clust;     /* Last allocated cluster */
N    DWORD   free_clust;     /* Number of free clusters */
N    DWORD   fsi_sector;     /* fsinfo sector (FAT32) */
N#endif
N#if _FS_RPATH
X#if 0
S    DWORD   cdir;           /* Current directory start cluster (0:root) */
N#endif
N    DWORD   n_fatent;       /* Number of FAT entries (= number of clusters + 2) */
N    DWORD   fsize;          /* Sectors per FAT */
N    DWORD   volbase;        /* Volume start sector */
N    DWORD   fatbase;        /* FAT start sector */
N    DWORD   dirbase;        /* Root directory start sector (FAT32:Cluster#) */
N    DWORD   database;       /* Data start sector */
N    DWORD   winsect;        /* Current sector appearing in the win[] */
N    BYTE    win[_MAX_SS];   /* Disk access window for Directory, FAT (and Data on tiny cfg) */
X    BYTE    win[512];    
N} FATFS;
N
N
N
N/* File object structure (FIL) */
N
Ntypedef struct {
N    FATFS*  fs;             /* Pointer to the related file system object (**do not change order**) */
N    WORD    id;             /* Owner file system mount ID (**do not change order**) */
N    BYTE    flag;           /* File status flags */
N    BYTE    pad1;
N    DWORD   fptr;           /* File read/write pointer (0ed on file open) */
N    DWORD   fsize;          /* File size */
N    DWORD   sclust;         /* File data start cluster (0:no data cluster, always 0 when fsize is 0) */
N    DWORD   clust;          /* Current cluster of fpter */
N    DWORD   dsect;          /* Current data sector of fpter */
N#if !_FS_READONLY
X#if !0
N    DWORD   dir_sect;       /* Sector containing the directory entry */
N    BYTE*   dir_ptr;        /* Pointer to the directory entry in the window */
N#endif
N#if _USE_FASTSEEK
X#if 0
S    DWORD*  cltbl;          /* Pointer to the cluster link map table (null on file open) */
N#endif
N#if _FS_LOCK
X#if 0
S    UINT    lockid;         /* File lock ID (index of file semaphore table Files[]) */
N#endif
N#if !_FS_TINY
X#if !0
N    BYTE    buf[_MAX_SS];   /* File data read/write buffer */
X    BYTE    buf[512];    
N#endif
N} FIL;
N
N
N
N/* Directory object structure (DIR) */
N
Ntypedef struct {
N    FATFS*  fs;             /* Pointer to the owner file system object (**do not change order**) */
N    WORD    id;             /* Owner file system mount ID (**do not change order**) */
N    WORD    index;          /* Current read/write index number */
N    DWORD   sclust;         /* Table start cluster (0:Root dir) */
N    DWORD   clust;          /* Current cluster */
N    DWORD   sect;           /* Current sector */
N    BYTE*   dir;            /* Pointer to the current SFN entry in the win[] */
N    BYTE*   fn;             /* Pointer to the SFN (in/out) {file[8],ext[3],status[1]} */
N#if _USE_LFN
X#if 0
S    WCHAR*  lfn;            /* Pointer to the LFN working buffer */
S    WORD    lfn_idx;        /* Last matched LFN index number (0xFFFF:No LFN) */
N#endif
N} DIR;
N
N
N
N/* File status structure (FILINFO) */
N
Ntypedef struct {
N    DWORD   fsize;          /* File size */
N    WORD    fdate;          /* Last modified date */
N    WORD    ftime;          /* Last modified time */
N    BYTE    fattrib;        /* Attribute */
N    TCHAR   fname[13];      /* Short file name (8.3 format) */
N#if _USE_LFN
X#if 0
S    TCHAR*  lfname;         /* Pointer to the LFN buffer */
S    UINT    lfsize;         /* Size of LFN buffer in TCHAR */
N#endif
N} FILINFO;
N
N
N
N/* File function return code (FRESULT) */
N
Ntypedef enum {
N    FR_OK = 0,              /* (0) Succeeded */
N    FR_DISK_ERR,            /* (1) A hard error occurred in the low level disk I/O layer */
N    FR_INT_ERR,             /* (2) Assertion failed */
N    FR_NOT_READY,           /* (3) The physical drive cannot work */
N    FR_NO_FILE,             /* (4) Could not find the file */
N    FR_NO_PATH,             /* (5) Could not find the path */
N    FR_INVALID_NAME,        /* (6) The path name format is invalid */
N    FR_DENIED,              /* (7) Access denied due to prohibited access or directory full */
N    FR_EXIST,               /* (8) Access denied due to prohibited access */
N    FR_INVALID_OBJECT,      /* (9) The file/directory object is invalid */
N    FR_WRITE_PROTECTED,     /* (10) The physical drive is write protected */
N    FR_INVALID_DRIVE,       /* (11) The logical drive number is invalid */
N    FR_NOT_ENABLED,         /* (12) The volume has no work area */
N    FR_NO_FILESYSTEM,       /* (13) There is no valid FAT volume */
N    FR_MKFS_ABORTED,        /* (14) The f_mkfs() aborted due to any parameter error */
N    FR_TIMEOUT,             /* (15) Could not get a grant to access the volume within defined period */
N    FR_LOCKED,              /* (16) The operation is rejected according to the file sharing policy */
N    FR_NOT_ENOUGH_CORE,     /* (17) LFN working buffer could not be allocated */
N    FR_TOO_MANY_OPEN_FILES, /* (18) Number of open files > _FS_SHARE */
N    FR_INVALID_PARAMETER    /* (19) Given parameter is invalid */
N} FRESULT;
N
N
N
N/*--------------------------------------------------------------*/
N/* FatFs module application interface                           */
N
NFRESULT f_mount (BYTE vol, FATFS* fs);                              /* Mount/Unmount a logical drive */
NFRESULT f_open (FIL* fp, const TCHAR* path, BYTE mode);             /* Open or create a file */
NFRESULT f_read (FIL* fp, void* buff, UINT btr, UINT* br);           /* Read data from a file */
NFRESULT f_lseek (FIL* fp, DWORD ofs);                               /* Move file pointer of a file object */
NFRESULT f_close (FIL* fp);                                          /* Close an open file object */
NFRESULT f_opendir (DIR* dj, const TCHAR* path);                     /* Open an existing directory */
NFRESULT f_readdir (DIR* dj, FILINFO* fno);                          /* Read a directory item */
NFRESULT f_stat (const TCHAR* path, FILINFO* fno);                   /* Get file status */
NFRESULT f_write (FIL* fp, const void* buff, UINT btw, UINT* bw);    /* Write data to a file */
NFRESULT f_getfree (const TCHAR* path, DWORD* nclst, FATFS** fatfs); /* Get number of free clusters on the drive */
NFRESULT f_truncate (FIL* fp);                                       /* Truncate file */
NFRESULT f_sync (FIL* fp);                                           /* Flush cached data of a writing file */
NFRESULT f_unlink (const TCHAR* path);                               /* Delete an existing file or directory */
NFRESULT f_mkdir (const TCHAR* path);                                /* Create a new directory */
NFRESULT f_chmod (const TCHAR* path, BYTE value, BYTE mask);         /* Change attribute of the file/dir */
NFRESULT f_utime (const TCHAR* path, const FILINFO* fno);            /* Change times-tamp of the file/dir */
NFRESULT f_rename (const TCHAR* path_old, const TCHAR* path_new);    /* Rename/Move a file or directory */
NFRESULT f_chdrive (BYTE drv);                                       /* Change current drive */
NFRESULT f_chdir (const TCHAR* path);                                /* Change current directory */
NFRESULT f_getcwd (TCHAR* buff, UINT len);                           /* Get current directory */
NFRESULT f_getlabel (const TCHAR* path, TCHAR* label, DWORD* sn);    /* Get volume label */
NFRESULT f_setlabel (const TCHAR* label);                            /* Set volume label */
NFRESULT f_forward (FIL* fp, UINT(*func)(const BYTE*,UINT), UINT btf, UINT* bf); /* Forward data to the stream */
NFRESULT f_mkfs (BYTE vol, BYTE sfd, UINT au);                       /* Create a file system on the drive */
NFRESULT f_fdisk (BYTE pdrv, const DWORD szt[], void* work);         /* Divide a physical drive into some partitions */
Nint f_putc (TCHAR c, FIL* fp);                                      /* Put a character to the file */
Nint f_puts (const TCHAR* str, FIL* cp);                             /* Put a string to the file */
Nint f_printf (FIL* fp, const TCHAR* str, ...);                      /* Put a formatted string to the file */
NTCHAR* f_gets (TCHAR* buff, int len, FIL* fp);                      /* Get a string from the file */
N
N#define f_eof(fp) (((fp)->fptr == (fp)->fsize) ? 1 : 0)
N#define f_error(fp) (((fp)->flag & FA__ERROR) ? 1 : 0)
N#define f_tell(fp) ((fp)->fptr)
N#define f_size(fp) ((fp)->fsize)
N
N#ifndef EOF
N#define EOF (-1)
N#endif
N
N
N
N
N/*--------------------------------------------------------------*/
N/* Additional user defined functions                            */
N
N/* RTC function */
N#if !_FS_READONLY
X#if !0
NDWORD get_fattime (void);
N#endif
N
N/* Unicode support functions */
N#if _USE_LFN                            /* Unicode - OEM code conversion */
X#if 0                             
SWCHAR ff_convert (WCHAR chr, UINT dir); /* OEM-Unicode bidirectional conversion */
SWCHAR ff_wtoupper (WCHAR chr);          /* Unicode upper-case conversion */
S#if _USE_LFN == 3                       /* Memory functions */
Svoid* ff_memalloc (UINT msize);         /* Allocate memory block */
Svoid ff_memfree (void* mblock);         /* Free memory block */
S#endif
N#endif
N
N/* Sync functions */
N#if _FS_REENTRANT
X#if 0
Sint ff_cre_syncobj (BYTE vol, _SYNC_t* sobj);   /* Create a sync object */
Sint ff_req_grant (_SYNC_t sobj);                /* Lock sync object */
Svoid ff_rel_grant (_SYNC_t sobj);               /* Unlock sync object */
Sint ff_del_syncobj (_SYNC_t sobj);              /* Delete a sync object */
N#endif
N
N
N
N
N/*--------------------------------------------------------------*/
N/* Flags and offset address                                     */
N
N
N/* File access control and file status flags (FIL.flag) */
N
N#define FA_READ             0x01
N#define FA_OPEN_EXISTING    0x00
N#define FA__ERROR           0x80
N
N#if !_FS_READONLY
X#if !0
N#define FA_WRITE            0x02
N#define FA_CREATE_NEW       0x04
N#define FA_CREATE_ALWAYS    0x08
N#define FA_OPEN_ALWAYS      0x10
N#define FA__WRITTEN         0x20
N#define FA__DIRTY           0x40
N#endif
N
N
N/* FAT sub type (FATFS.fs_type) */
N
N#define FS_FAT12    1
N#define FS_FAT16    2
N#define FS_FAT32    3
N
N
N/* File attribute bits for directory entry */
N
N#define AM_RDO  0x01    /* Read only */
N#define AM_HID  0x02    /* Hidden */
N#define AM_SYS  0x04    /* System */
N#define AM_VOL  0x08    /* Volume label */
N#define AM_LFN  0x0F    /* LFN entry */
N#define AM_DIR  0x10    /* Directory */
N#define AM_ARC  0x20    /* Archive */
N#define AM_MASK 0x3F    /* Mask of defined bits */
N
N
N/* Fast seek feature */
N#define CREATE_LINKMAP  0xFFFFFFFF
N
N
N
N/*--------------------------------*/
N/* Multi-byte word access macros  */
N
N#if _WORD_ACCESS == 1   /* Enable word access to the FAT structure */
X#if 0 == 1    
S#define LD_WORD(ptr)        (WORD)(*(WORD*)(BYTE*)(ptr))
S#define LD_DWORD(ptr)       (DWORD)(*(DWORD*)(BYTE*)(ptr))
S#define ST_WORD(ptr,val)    *(WORD*)(BYTE*)(ptr)=(WORD)(val)
S#define ST_DWORD(ptr,val)   *(DWORD*)(BYTE*)(ptr)=(DWORD)(val)
N#else                   /* Use byte-by-byte access to the FAT structure */
N#define LD_WORD(ptr)        (WORD)(((WORD)*((BYTE*)(ptr)+1)<<8)|(WORD)*(BYTE*)(ptr))
N#define LD_DWORD(ptr)       (DWORD)(((DWORD)*((BYTE*)(ptr)+3)<<24)|((DWORD)*((BYTE*)(ptr)+2)<<16)|((WORD)*((BYTE*)(ptr)+1)<<8)|*(BYTE*)(ptr))
N#define ST_WORD(ptr,val)    *(BYTE*)(ptr)=(BYTE)(val); *((BYTE*)(ptr)+1)=(BYTE)((WORD)(val)>>8)
N#define ST_DWORD(ptr,val)   *(BYTE*)(ptr)=(BYTE)(val); *((BYTE*)(ptr)+1)=(BYTE)((WORD)(val)>>8); *((BYTE*)(ptr)+2)=(BYTE)((DWORD)(val)>>16); *((BYTE*)(ptr)+3)=(BYTE)((DWORD)(val)>>24)
N#endif
N
N#ifdef __cplusplus
S}
N#endif
N
N#endif /* _FATFS */
L 100 "../ff.c" 2
N#include "diskio.h"     /* Declarations of low level disk I/O functions */
L 1 "..\diskio.h" 1
N/*-----------------------------------------------------------------------
N/  Low level disk interface modlue include file   (C)ChaN, 2013
N/-----------------------------------------------------------------------*/
N
N#ifndef _DISKIO_DEFINED
N#define _DISKIO_DEFINED
N
N#ifdef __cplusplus
Sextern "C" {
N#endif
N
N#define _USE_WRITE  1   /* 1: Enable disk_write function */
N#define _USE_IOCTL  1   /* 1: Enable disk_ioctl fucntion */
N
N#include "integer.h"
N
N
N/* Status of Disk Functions */
Ntypedef BYTE    DSTATUS;
N
N/* Results of Disk Functions */
Ntypedef enum {
N    RES_OK = 0,     /* 0: Successful */
N    RES_ERROR,      /* 1: R/W Error */
N    RES_WRPRT,      /* 2: Write Protected */
N    RES_NOTRDY,     /* 3: Not Ready */
N    RES_PARERR      /* 4: Invalid Parameter */
N} DRESULT;
N
N
N/*---------------------------------------*/
N/* Prototypes for disk control functions */
N
N
NDSTATUS disk_initialize (BYTE pdrv);
NDSTATUS disk_status (BYTE pdrv);
NDRESULT disk_read (
N    BYTE drv,            /* Physical drive nmuber (0) */
N    BYTE *buff,            /* Pointer to the data buffer to store read data */
N    DWORD sector,        /* Start sector number (LBA) */
N    BYTE count            /* Sector count (1..255) */
N);
NDRESULT disk_write (
N    BYTE drv,            /* Physical drive nmuber (0) */
N    const BYTE *buff,    /* Pointer to the data to be written */
N    DWORD sector,        /* Start sector number (LBA) */
N    BYTE count            /* Sector count (1..255) */
N);
NDRESULT disk_ioctl (BYTE pdrv, BYTE cmd, void* buff);
Nvoid    disk_timerproc (void);
N
N/* Disk Status Bits (DSTATUS) */
N#define STA_NOINIT      0x01    /* Drive not initialized */
N#define STA_NODISK      0x02    /* No medium in the drive */
N#define STA_PROTECT     0x04    /* Write protected */
N
N
N/* Command code for disk_ioctrl fucntion */
N
N/* Generic command (used by FatFs) */
N#define CTRL_SYNC           0   /* Flush disk cache (for write functions) */
N#define GET_SECTOR_COUNT    1   /* Get media size (for only f_mkfs()) */
N#define GET_SECTOR_SIZE     2   /* Get sector size (for multiple sector size (_MAX_SS >= 1024)) */
N#define GET_BLOCK_SIZE      3   /* Get erase block size (for only f_mkfs()) */
N#define CTRL_ERASE_SECTOR   4   /* Force erased a block of sectors (for only _USE_ERASE) */
N
N/* Generic command (not used by FatFs) */
N#define CTRL_POWER          5   /* Get/Set power status */
N#define CTRL_LOCK           6   /* Lock/Unlock media removal */
N#define CTRL_EJECT          7   /* Eject media */
N#define CTRL_FORMAT         8   /* Create physical format on the media */
N
N/* MMC/SDC specific ioctl command */
N#define MMC_GET_TYPE        10  /* Get card type */
N#define MMC_GET_CSD         11  /* Get CSD */
N#define MMC_GET_CID         12  /* Get CID */
N#define MMC_GET_OCR         13  /* Get OCR */
N#define MMC_GET_SDSTAT      14  /* Get SD status */
N
N/* ATA/CF specific ioctl command */
N#define ATA_GET_REV         20  /* Get F/W revision */
N#define ATA_GET_MODEL       21  /* Get model name */
N#define ATA_GET_SN          22  /* Get serial number */
N
N
N/* MMC card type flags (MMC_GET_TYPE) */
N#define CT_MMC      0x01        /* MMC ver 3 */
N#define CT_SD1      0x02        /* SD ver 1 */
N#define CT_SD2      0x04        /* SD ver 2 */
N#define CT_SDC      (CT_SD1|CT_SD2) /* SD */
N#define CT_BLOCK    0x08        /* Block addressing */
N
N
N#ifdef __cplusplus
S}
N#endif
N
N#endif
L 101 "../ff.c" 2
N
N
N/*--------------------------------------------------------------------------
N
N   Module Private Definitions
N
N---------------------------------------------------------------------------*/
N
N#if _FATFS != 82786 /* Revision ID */
X#if 82786 != 82786  
S#error Wrong include file (ff.h).
N#endif
N
N
N/* Definitions on sector size */
N#if _MAX_SS != 512 && _MAX_SS != 1024 && _MAX_SS != 2048 && _MAX_SS != 4096
X#if 512 != 512 && 512 != 1024 && 512 != 2048 && 512 != 4096
S#error Wrong sector size.
N#endif
N#if _MAX_SS != 512
X#if 512 != 512
S#define SS(fs)  ((fs)->ssize)   /* Variable sector size */
N#else
N#define SS(fs)  512U            /* Fixed sector size */
N#endif
N
N
N/* Reentrancy related */
N#if _FS_REENTRANT
X#if 0
S#if _USE_LFN == 1
S#error Static LFN work area must not be used in re-entrant configuration.
S#endif
S#define ENTER_FF(fs)        { if (!lock_fs(fs)) return FR_TIMEOUT; }
S#define LEAVE_FF(fs, res)   { unlock_fs(fs, res); return res; }
N#else
N#define ENTER_FF(fs)
N#define LEAVE_FF(fs, res)   return res
N#endif
N
N#define ABORT(fs, res)      { fp->flag |= FA__ERROR; LEAVE_FF(fs, res); }
N
N
N/* File access control feature */
N#if _FS_LOCK
X#if 0
S#if _FS_READONLY
S#error _FS_LOCK must be 0 on read-only cfg.
S#endif
Stypedef struct {
S    FATFS *fs;              /* File ID 1, volume (NULL:blank entry) */
S    DWORD clu;              /* File ID 2, directory */
S    WORD idx;               /* File ID 3, directory index */
S    WORD ctr;               /* File open counter, 0:none, 0x01..0xFF:read open count, 0x100:write mode */
S} FILESEM;
N#endif
N
N
N
N/* DBCS code ranges and SBCS extend char conversion table */
N
N#if _CODE_PAGE == 932   /* Japanese Shift-JIS */
X#if 932 == 932    
N#define _DF1S   0x81    /* DBC 1st byte range 1 start */
N#define _DF1E   0x9F    /* DBC 1st byte range 1 end */
N#define _DF2S   0xE0    /* DBC 1st byte range 2 start */
N#define _DF2E   0xFC    /* DBC 1st byte range 2 end */
N#define _DS1S   0x40    /* DBC 2nd byte range 1 start */
N#define _DS1E   0x7E    /* DBC 2nd byte range 1 end */
N#define _DS2S   0x80    /* DBC 2nd byte range 2 start */
N#define _DS2E   0xFC    /* DBC 2nd byte range 2 end */
N
N#elif _CODE_PAGE == 936 /* Simplified Chinese GBK */
S#define _DF1S   0x81
S#define _DF1E   0xFE
S#define _DS1S   0x40
S#define _DS1E   0x7E
S#define _DS2S   0x80
S#define _DS2E   0xFE
S
S#elif _CODE_PAGE == 949 /* Korean */
S#define _DF1S   0x81
S#define _DF1E   0xFE
S#define _DS1S   0x41
S#define _DS1E   0x5A
S#define _DS2S   0x61
S#define _DS2E   0x7A
S#define _DS3S   0x81
S#define _DS3E   0xFE
S
S#elif _CODE_PAGE == 950 /* Traditional Chinese Big5 */
S#define _DF1S   0x81
S#define _DF1E   0xFE
S#define _DS1S   0x40
S#define _DS1E   0x7E
S#define _DS2S   0xA1
S#define _DS2E   0xFE
S
S#elif _CODE_PAGE == 437 /* U.S. (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F,0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F,0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 720 /* Arabic (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x45,0x41,0x84,0x41,0x86,0x43,0x45,0x45,0x45,0x49,0x49,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x49,0x49,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x81,0x45,0x41,0x84,0x41,0x86,0x43,0x45,0x45,0x45,0x49,0x49,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x49,0x49,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 737 /* Greek (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x96,0x97,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87, \
S                0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0xAA,0x92,0x93,0x94,0x95,0x96,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0x97,0xEA,0xEB,0xEC,0xE4,0xED,0xEE,0xE7,0xE8,0xF1,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x96,0x97,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,                 0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0xAA,0x92,0x93,0x94,0x95,0x96,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0x97,0xEA,0xEB,0xEC,0xE4,0xED,0xEE,0xE7,0xE8,0xF1,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 775 /* Baltic (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x9A,0x91,0xA0,0x8E,0x95,0x8F,0x80,0xAD,0xED,0x8A,0x8A,0xA1,0x8D,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0x95,0x96,0x97,0x97,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \
S                0xA0,0xA1,0xE0,0xA3,0xA3,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xB5,0xB6,0xB7,0xB8,0xBD,0xBE,0xC6,0xC7,0xA5,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE3,0xE8,0xE8,0xEA,0xEA,0xEE,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x9A,0x91,0xA0,0x8E,0x95,0x8F,0x80,0xAD,0xED,0x8A,0x8A,0xA1,0x8D,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0x95,0x96,0x97,0x97,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F,                 0xA0,0xA1,0xE0,0xA3,0xA3,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xB5,0xB6,0xB7,0xB8,0xBD,0xBE,0xC6,0xC7,0xA5,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE3,0xE8,0xE8,0xEA,0xEA,0xEE,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 850 /* Multilingual Latin 1 (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \
S                0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F,                 0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 852 /* Latin 2 (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xDE,0x8F,0x80,0x9D,0xD3,0x8A,0x8A,0xD7,0x8D,0x8E,0x8F,0x90,0x91,0x91,0xE2,0x99,0x95,0x95,0x97,0x97,0x99,0x9A,0x9B,0x9B,0x9D,0x9E,0x9F, \
S                0xB5,0xD6,0xE0,0xE9,0xA4,0xA4,0xA6,0xA6,0xA8,0xA8,0xAA,0x8D,0xAC,0xB8,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBD,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC6,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD2,0xD5,0xD6,0xD7,0xB7,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE3,0xD5,0xE6,0xE6,0xE8,0xE9,0xE8,0xEB,0xED,0xED,0xDD,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xEB,0xFC,0xFC,0xFE,0xFF}
X#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xDE,0x8F,0x80,0x9D,0xD3,0x8A,0x8A,0xD7,0x8D,0x8E,0x8F,0x90,0x91,0x91,0xE2,0x99,0x95,0x95,0x97,0x97,0x99,0x9A,0x9B,0x9B,0x9D,0x9E,0x9F,                 0xB5,0xD6,0xE0,0xE9,0xA4,0xA4,0xA6,0xA6,0xA8,0xA8,0xAA,0x8D,0xAC,0xB8,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBD,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC6,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD2,0xD5,0xD6,0xD7,0xB7,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE3,0xD5,0xE6,0xE6,0xE8,0xE9,0xE8,0xEB,0xED,0xED,0xDD,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xEB,0xFC,0xFC,0xFE,0xFF}
S
S#elif _CODE_PAGE == 855 /* Cyrillic (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x81,0x81,0x83,0x83,0x85,0x85,0x87,0x87,0x89,0x89,0x8B,0x8B,0x8D,0x8D,0x8F,0x8F,0x91,0x91,0x93,0x93,0x95,0x95,0x97,0x97,0x99,0x99,0x9B,0x9B,0x9D,0x9D,0x9F,0x9F, \
S                0xA1,0xA1,0xA3,0xA3,0xA5,0xA5,0xA7,0xA7,0xA9,0xA9,0xAB,0xAB,0xAD,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB6,0xB6,0xB8,0xB8,0xB9,0xBA,0xBB,0xBC,0xBE,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD3,0xD3,0xD5,0xD5,0xD7,0xD7,0xDD,0xD9,0xDA,0xDB,0xDC,0xDD,0xE0,0xDF, \
S                0xE0,0xE2,0xE2,0xE4,0xE4,0xE6,0xE6,0xE8,0xE8,0xEA,0xEA,0xEC,0xEC,0xEE,0xEE,0xEF,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF8,0xFA,0xFA,0xFC,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x81,0x81,0x83,0x83,0x85,0x85,0x87,0x87,0x89,0x89,0x8B,0x8B,0x8D,0x8D,0x8F,0x8F,0x91,0x91,0x93,0x93,0x95,0x95,0x97,0x97,0x99,0x99,0x9B,0x9B,0x9D,0x9D,0x9F,0x9F,                 0xA1,0xA1,0xA3,0xA3,0xA5,0xA5,0xA7,0xA7,0xA9,0xA9,0xAB,0xAB,0xAD,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB6,0xB6,0xB8,0xB8,0xB9,0xBA,0xBB,0xBC,0xBE,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD3,0xD3,0xD5,0xD5,0xD7,0xD7,0xDD,0xD9,0xDA,0xDB,0xDC,0xDD,0xE0,0xDF,                 0xE0,0xE2,0xE2,0xE4,0xE4,0xE6,0xE6,0xE8,0xE8,0xEA,0xEA,0xEC,0xEC,0xEE,0xEE,0xEF,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF8,0xFA,0xFA,0xFC,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 857 /* Turkish (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0x98,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x98,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9E, \
S                0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA6,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xDE,0x59,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0x98,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x98,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9E,                 0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA6,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xDE,0x59,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 858 /* Multilingual Latin 1 + Euro (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \
S                0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F,                 0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 862 /* Hebrew (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 866 /* Russian (OEM) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0x90,0x91,0x92,0x93,0x9d,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,0xF0,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0x90,0x91,0x92,0x93,0x9d,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,0xF0,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 874 /* Thai (OEM, Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 1250 /* Central Europe (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \
S                0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xA3,0xB4,0xB5,0xB6,0xB7,0xB8,0xA5,0xAA,0xBB,0xBC,0xBD,0xBC,0xAF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F,                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xA3,0xB4,0xB5,0xB6,0xB7,0xB8,0xA5,0xAA,0xBB,0xBC,0xBD,0xBC,0xAF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
S
S#elif _CODE_PAGE == 1251 /* Cyrillic (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x82,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x80,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \
S                0xA0,0xA2,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB2,0xA5,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xA3,0xBD,0xBD,0xAF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF}
X#define _EXCVT {0x80,0x81,0x82,0x82,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x80,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F,                 0xA0,0xA2,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB2,0xA5,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xA3,0xBD,0xBD,0xAF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF}
S
S#elif _CODE_PAGE == 1252 /* Latin 1 (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0xAd,0x9B,0x8C,0x9D,0xAE,0x9F, \
S                0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0xAd,0x9B,0x8C,0x9D,0xAE,0x9F,                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
S
S#elif _CODE_PAGE == 1253 /* Greek (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xA2,0xB8,0xB9,0xBA, \
S                0xE0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xFB,0xBC,0xFD,0xBF,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xA2,0xB8,0xB9,0xBA,                 0xE0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xFB,0xBC,0xFD,0xBF,0xFF}
S
S#elif _CODE_PAGE == 1254 /* Turkish (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x9D,0x9E,0x9F, \
S                0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x9D,0x9E,0x9F,                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
S
S#elif _CODE_PAGE == 1255 /* Hebrew (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 1256 /* Arabic (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x8C,0x9D,0x9E,0x9F, \
S                0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0x41,0xE1,0x41,0xE3,0xE4,0xE5,0xE6,0x43,0x45,0x45,0x45,0x45,0xEC,0xED,0x49,0x49,0xF0,0xF1,0xF2,0xF3,0x4F,0xF5,0xF6,0xF7,0xF8,0x55,0xFA,0x55,0x55,0xFD,0xFE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x8C,0x9D,0x9E,0x9F,                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0x41,0xE1,0x41,0xE3,0xE4,0xE5,0xE6,0x43,0x45,0x45,0x45,0x45,0xEC,0xED,0x49,0x49,0xF0,0xF1,0xF2,0xF3,0x4F,0xF5,0xF6,0xF7,0xF8,0x55,0xFA,0x55,0x55,0xFD,0xFE,0xFF}
S
S#elif _CODE_PAGE == 1257 /* Baltic (Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \
S                0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xBC,0xBD,0xBE,0xAF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xBC,0xBD,0xBE,0xAF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
S
S#elif _CODE_PAGE == 1258 /* Vietnam (OEM, Windows) */
S#define _DF1S   0
S#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0xAC,0x9D,0x9E,0x9F, \
S                0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \
S                0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xEC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xFE,0x9F}
X#define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0xAC,0x9D,0x9E,0x9F,                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF,                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xEC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xFE,0x9F}
S
S#elif _CODE_PAGE == 1   /* ASCII (for only non-LFN cfg) */
S#if _USE_LFN
S#error Cannot use LFN feature without valid code page.
S#endif
S#define _DF1S   0
S
S#else
S#error Unknown code page
S
N#endif
N
N
N/* Character code support macros */
N#define IsUpper(c)  (((c)>='A')&&((c)<='Z'))
N#define IsLower(c)  (((c)>='a')&&((c)<='z'))
N#define IsDigit(c)  (((c)>='0')&&((c)<='9'))
N
N#if _DF1S       /* Code page is DBCS */
X#if 0x81        
N
N#ifdef _DF2S    /* Two 1st byte areas */
N#define IsDBCS1(c)  (((BYTE)(c) >= _DF1S && (BYTE)(c) <= _DF1E) || ((BYTE)(c) >= _DF2S && (BYTE)(c) <= _DF2E))
N#else           /* One 1st byte area */
S#define IsDBCS1(c)  ((BYTE)(c) >= _DF1S && (BYTE)(c) <= _DF1E)
N#endif
N
N#ifdef _DS3S    /* Three 2nd byte areas */
S#define IsDBCS2(c)  (((BYTE)(c) >= _DS1S && (BYTE)(c) <= _DS1E) || ((BYTE)(c) >= _DS2S && (BYTE)(c) <= _DS2E) || ((BYTE)(c) >= _DS3S && (BYTE)(c) <= _DS3E))
N#else           /* Two 2nd byte areas */
N#define IsDBCS2(c)  (((BYTE)(c) >= _DS1S && (BYTE)(c) <= _DS1E) || ((BYTE)(c) >= _DS2S && (BYTE)(c) <= _DS2E))
N#endif
N
N#else           /* Code page is SBCS */
S
S#define IsDBCS1(c)  0
S#define IsDBCS2(c)  0
S
N#endif /* _DF1S */
N
N
N/* Name status flags */
N#define NS          11      /* Index of name status byte in fn[] */
N#define NS_LOSS     0x01    /* Out of 8.3 format */
N#define NS_LFN      0x02    /* Force to create LFN entry */
N#define NS_LAST     0x04    /* Last segment */
N#define NS_BODY     0x08    /* Lower case flag (body) */
N#define NS_EXT      0x10    /* Lower case flag (ext) */
N#define NS_DOT      0x20    /* Dot entry */
N
N
N/* FAT sub-type boundaries */
N/* Note that the FAT spec by Microsoft says 4085 but Windows works with 4087! */
N#define MIN_FAT16   4086    /* Minimum number of clusters for FAT16 */
N#define MIN_FAT32   65526   /* Minimum number of clusters for FAT32 */
N
N
N/* FatFs refers the members in the FAT structures as byte array instead of
N/ structure member because the structure is not binary compatible between
N/ different platforms */
N
N#define BS_jmpBoot          0   /* Jump instruction (3) */
N#define BS_OEMName          3   /* OEM name (8) */
N#define BPB_BytsPerSec      11  /* Sector size [byte] (2) */
N#define BPB_SecPerClus      13  /* Cluster size [sector] (1) */
N#define BPB_RsvdSecCnt      14  /* Size of reserved area [sector] (2) */
N#define BPB_NumFATs         16  /* Number of FAT copies (1) */
N#define BPB_RootEntCnt      17  /* Number of root dir entries for FAT12/16 (2) */
N#define BPB_TotSec16        19  /* Volume size [sector] (2) */
N#define BPB_Media           21  /* Media descriptor (1) */
N#define BPB_FATSz16         22  /* FAT size [sector] (2) */
N#define BPB_SecPerTrk       24  /* Track size [sector] (2) */
N#define BPB_NumHeads        26  /* Number of heads (2) */
N#define BPB_HiddSec         28  /* Number of special hidden sectors (4) */
N#define BPB_TotSec32        32  /* Volume size [sector] (4) */
N#define BS_DrvNum           36  /* Physical drive number (2) */
N#define BS_BootSig          38  /* Extended boot signature (1) */
N#define BS_VolID            39  /* Volume serial number (4) */
N#define BS_VolLab           43  /* Volume label (8) */
N#define BS_FilSysType       54  /* File system type (1) */
N#define BPB_FATSz32         36  /* FAT size [sector] (4) */
N#define BPB_ExtFlags        40  /* Extended flags (2) */
N#define BPB_FSVer           42  /* File system version (2) */
N#define BPB_RootClus        44  /* Root dir first cluster (4) */
N#define BPB_FSInfo          48  /* Offset of FSInfo sector (2) */
N#define BPB_BkBootSec       50  /* Offset of backup boot sector (2) */
N#define BS_DrvNum32         64  /* Physical drive number (2) */
N#define BS_BootSig32        66  /* Extended boot signature (1) */
N#define BS_VolID32          67  /* Volume serial number (4) */
N#define BS_VolLab32         71  /* Volume label (8) */
N#define BS_FilSysType32     82  /* File system type (1) */
N#define FSI_LeadSig         0   /* FSI: Leading signature (4) */
N#define FSI_StrucSig        484 /* FSI: Structure signature (4) */
N#define FSI_Free_Count      488 /* FSI: Number of free clusters (4) */
N#define FSI_Nxt_Free        492 /* FSI: Last allocated cluster (4) */
N#define MBR_Table           446 /* MBR: Partition table offset (2) */
N#define SZ_PTE              16  /* MBR: Size of a partition table entry */
N#define BS_55AA             510 /* Boot sector signature (2) */
N
N#define DIR_Name            0   /* Short file name (11) */
N#define DIR_Attr            11  /* Attribute (1) */
N#define DIR_NTres           12  /* NT flag (1) */
N#define DIR_CrtTimeTenth    13  /* Created time sub-second (1) */
N#define DIR_CrtTime         14  /* Created time (2) */
N#define DIR_CrtDate         16  /* Created date (2) */
N#define DIR_LstAccDate      18  /* Last accessed date (2) */
N#define DIR_FstClusHI       20  /* Higher 16-bit of first cluster (2) */
N#define DIR_WrtTime         22  /* Modified time (2) */
N#define DIR_WrtDate         24  /* Modified date (2) */
N#define DIR_FstClusLO       26  /* Lower 16-bit of first cluster (2) */
N#define DIR_FileSize        28  /* File size (4) */
N#define LDIR_Ord            0   /* LFN entry order and LLE flag (1) */
N#define LDIR_Attr           11  /* LFN attribute (1) */
N#define LDIR_Type           12  /* LFN type (1) */
N#define LDIR_Chksum         13  /* Sum of corresponding SFN entry */
N#define LDIR_FstClusLO      26  /* Filled by zero (0) */
N#define SZ_DIR              32      /* Size of a directory entry */
N#define LLE                 0x40    /* Last long entry flag in LDIR_Ord */
N#define DDE                 0xE5    /* Deleted directory entry mark in DIR_Name[0] */
N#define NDDE                0x05    /* Replacement of the character collides with DDE */
N
N
N/*------------------------------------------------------------*/
N/* Module private work area                                   */
N/*------------------------------------------------------------*/
N/* Note that uninitialized variables with static duration are
N/  zeroed/nulled at start-up. If not, the compiler or start-up
N/  routine is out of ANSI-C standard.
N*/
N
N#if _VOLUMES
X#if 1
Nstatic
NFATFS *FatFs[_VOLUMES]; /* Pointer to the file system objects (logical drives) */
XFATFS *FatFs[1];  
N#else
S#error Number of volumes must not be 0.
N#endif
N
Nstatic
NWORD Fsid;              /* File system mount ID */
N
N#if _FS_RPATH
X#if 0
Sstatic
SBYTE CurrVol;           /* Current drive */
N#endif
N
N#if _FS_LOCK
X#if 0
Sstatic
SFILESEM Files[_FS_LOCK];    /* File lock semaphores */
N#endif
N
N#if _USE_LFN == 0           /* No LFN feature */
X#if 0 == 0            
N#define DEF_NAMEBUF         BYTE sfn[12]
N#define INIT_BUF(dobj)      (dobj).fn = sfn
N#define FREE_BUF()
N
N#elif _USE_LFN == 1         /* LFN feature with static working buffer */
Sstatic WCHAR LfnBuf[_MAX_LFN+1];
S#define DEF_NAMEBUF         BYTE sfn[12]
S#define INIT_BUF(dobj)      { (dobj).fn = sfn; (dobj).lfn = LfnBuf; }
S#define FREE_BUF()
S
S#elif _USE_LFN == 2         /* LFN feature with dynamic working buffer on the stack */
S#define DEF_NAMEBUF         BYTE sfn[12]; WCHAR lbuf[_MAX_LFN+1]
S#define INIT_BUF(dobj)      { (dobj).fn = sfn; (dobj).lfn = lbuf; }
S#define FREE_BUF()
S
S#elif _USE_LFN == 3         /* LFN feature with dynamic working buffer on the heap */
S#define DEF_NAMEBUF         BYTE sfn[12]; WCHAR *lfn
S#define INIT_BUF(dobj)      { lfn = ff_memalloc((_MAX_LFN + 1) * 2); \
S                              if (!lfn) LEAVE_FF((dobj).fs, FR_NOT_ENOUGH_CORE); \
S                              (dobj).lfn = lfn; (dobj).fn = sfn; }
X#define INIT_BUF(dobj)      { lfn = ff_memalloc((_MAX_LFN + 1) * 2);                               if (!lfn) LEAVE_FF((dobj).fs, FR_NOT_ENOUGH_CORE);                               (dobj).lfn = lfn; (dobj).fn = sfn; }
S#define FREE_BUF()          ff_memfree(lfn)
S
S#else
S#error Wrong LFN configuration.
N#endif
N
N
N#ifdef _EXCVT
Sstatic
Sconst BYTE ExCvt[] = _EXCVT;    /* Upper conversion table for extended chars */
N#endif
N
N
N
N
N
N
N/*--------------------------------------------------------------------------
N
N   Module Private Functions
N
N---------------------------------------------------------------------------*/
N
N
N/*-----------------------------------------------------------------------*/
N/* String functions                                                      */
N/*-----------------------------------------------------------------------*/
N
N/* Copy memory to memory */
Nstatic
Nvoid mem_cpy (void* dst, const void* src, UINT cnt) {
N    BYTE *d = (BYTE*)dst;
N    const BYTE *s = (const BYTE*)src;
N
N#if _WORD_ACCESS == 1
X#if 0 == 1
S    while (cnt >= sizeof (int)) {
S        *(int*)d = *(int*)s;
S        d += sizeof (int); s += sizeof (int);
S        cnt -= sizeof (int);
S    }
N#endif
N    while (cnt--)
N        *d++ = *s++;
N}
N
N/* Fill memory */
Nstatic
Nvoid mem_set (void* dst, int val, UINT cnt) {
N    BYTE *d = (BYTE*)dst;
N
N    while (cnt--)
N        *d++ = (BYTE)val;
N}
N
N/* Compare memory to memory */
Nstatic
Nint mem_cmp (const void* dst, const void* src, UINT cnt) {
N    const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
N    int r = 0;
N
N    while (cnt-- && (r = *d++ - *s++) == 0) ;
N    return r;
R "../ff.c" 569 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
N}
N
N/* Check if chr is contained in the string */
Nstatic
Nint chk_chr (const char* str, int chr) {
N    while (*str && *str != chr) str++;
N    return *str;
N}
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Request/Release grant to access the volume                            */
N/*-----------------------------------------------------------------------*/
N#if _FS_REENTRANT
X#if 0
S
Sstatic
Sint lock_fs (
S    FATFS *fs       /* File system object */
S)
S{
S    return ff_req_grant(fs->sobj);
S}
S
S
Sstatic
Svoid unlock_fs (
S    FATFS *fs,      /* File system object */
S    FRESULT res     /* Result code to be returned */
S)
S{
S    if (fs &&
S        res != FR_NOT_ENABLED &&
S        res != FR_INVALID_DRIVE &&
S        res != FR_INVALID_OBJECT &&
S        res != FR_TIMEOUT) {
S        ff_rel_grant(fs->sobj);
S    }
S}
N#endif
N
N
N
N/*-----------------------------------------------------------------------*/
N/* File lock control functions                                           */
N/*-----------------------------------------------------------------------*/
N#if _FS_LOCK
X#if 0
S
Sstatic
SFRESULT chk_lock (  /* Check if the file can be accessed */
S    DIR* dj,        /* Directory object pointing the file to be checked */
S    int acc         /* Desired access (0:Read, 1:Write, 2:Delete/Rename) */
S)
S{
S    UINT i, be;
S
S    /* Search file semaphore table */
S    for (i = be = 0; i < _FS_LOCK; i++) {
S        if (Files[i].fs) {  /* Existing entry */
S            if (Files[i].fs == dj->fs &&        /* Check if the file matched with an open file */
S                Files[i].clu == dj->sclust &&
S                Files[i].idx == dj->index) break;
S        } else {            /* Blank entry */
S            be++;
S        }
S    }
S    if (i == _FS_LOCK)  /* The file is not opened */
S        return (be || acc == 2) ? FR_OK : FR_TOO_MANY_OPEN_FILES;   /* Is there a blank entry for new file? */
S
S    /* The file has been opened. Reject any open against writing file and all write mode open */
S    return (acc || Files[i].ctr == 0x100) ? FR_LOCKED : FR_OK;
S}
S
S
Sstatic
Sint enq_lock (void) /* Check if an entry is available for a new file */
S{
S    UINT i;
S
S    for (i = 0; i < _FS_LOCK && Files[i].fs; i++) ;
S    return (i == _FS_LOCK) ? 0 : 1;
S}
S
S
Sstatic
SUINT inc_lock ( /* Increment file open counter and returns its index (0:int error) */
S    DIR* dj,    /* Directory object pointing the file to register or increment */
S    int acc     /* Desired access mode (0:Read, !0:Write) */
S)
S{
S    UINT i;
S
S
S    for (i = 0; i < _FS_LOCK; i++) {    /* Find the file */
S        if (Files[i].fs == dj->fs &&
S            Files[i].clu == dj->sclust &&
S            Files[i].idx == dj->index) break;
S    }
S
S    if (i == _FS_LOCK) {                /* Not opened. Register it as new. */
S        for (i = 0; i < _FS_LOCK && Files[i].fs; i++) ;
S        if (i == _FS_LOCK) return 0;    /* No space to register (int err) */
S        Files[i].fs = dj->fs;
S        Files[i].clu = dj->sclust;
S        Files[i].idx = dj->index;
S        Files[i].ctr = 0;
S    }
S
S    if (acc && Files[i].ctr) return 0;  /* Access violation (int err) */
S
S    Files[i].ctr = acc ? 0x100 : Files[i].ctr + 1;  /* Set semaphore value */
S
S    return i + 1;
S}
S
S
Sstatic
SFRESULT dec_lock (  /* Decrement file open counter */
S    UINT i          /* Semaphore index */
S)
S{
S    WORD n;
S    FRESULT res;
S
S
S    if (--i < _FS_LOCK) {
S        n = Files[i].ctr;
S        if (n == 0x100) n = 0;
S        if (n) n--;
S        Files[i].ctr = n;
S        if (!n) Files[i].fs = 0;
S        res = FR_OK;
S    } else {
S        res = FR_INT_ERR;
S    }
S    return res;
S}
S
S
Sstatic
Svoid clear_lock (   /* Clear lock entries of the volume */
S    FATFS *fs
S)
S{
S    UINT i;
S
S    for (i = 0; i < _FS_LOCK; i++) {
S        if (Files[i].fs == fs) Files[i].fs = 0;
S    }
S}
N#endif
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Move/Flush disk access window                                         */
N/*-----------------------------------------------------------------------*/
N
N
N#if !_FS_READONLY
X#if !0
Nstatic
NFRESULT sync_window (
N    FATFS *fs       /* File system object */
N)
N{
N    DWORD wsect;
N    UINT nf;
N
N
N    if (fs->wflag) {    /* Write back the sector if it is dirty */
N        wsect = fs->winsect;    /* Current sector number */
N        if (disk_write(fs->drv, fs->win, wsect, 1) != RES_OK)
N            return FR_DISK_ERR;
N        fs->wflag = 0;
N        if (wsect >= fs->fatbase && wsect < (fs->fatbase + fs->fsize)) {    /* In FAT area? */
N            for (nf = fs->n_fats; nf >= 2; nf--) {  /* Reflect the change to all FAT copies */
N                wsect += fs->fsize;
N                disk_write(fs->drv, fs->win, wsect, 1);
N            }
N        }
N    }
N    return FR_OK;
N}
N#endif
N
N
Nstatic
NFRESULT move_window (
N    FATFS *fs,      /* File system object */
N    DWORD sector    /* Sector number to make appearance in the fs->win[] */
N)
N{
N    if (sector != fs->winsect) {    /* Changed current window */
N#if !_FS_READONLY
X#if !0
N        if (sync_window(fs) != FR_OK)
N            return FR_DISK_ERR;
N#endif
N        if (disk_read(fs->drv, fs->win, sector, 1) != RES_OK)
N            return FR_DISK_ERR;
N        fs->winsect = sector;
N    }
N
N    return FR_OK;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Synchronize file system and strage device                             */
N/*-----------------------------------------------------------------------*/
N#if !_FS_READONLY
X#if !0
Nstatic
NFRESULT sync_fs (   /* FR_OK: successful, FR_DISK_ERR: failed */
N    FATFS *fs       /* File system object */
N)
N{
N    FRESULT res;
N
N
N    res = sync_window(fs);
N    if (res == FR_OK) {
N        /* Update FSInfo sector if needed */
N        if (fs->fs_type == FS_FAT32 && fs->fsi_flag) {
X        if (fs->fs_type == 3 && fs->fsi_flag) {
N            fs->winsect = 0;
N            /* Create FSInfo structure */
N            mem_set(fs->win, 0, 512);
N            ST_WORD(fs->win+BS_55AA, 0xAA55);
X            *(BYTE*)(fs->win+510)=(BYTE)(0xAA55); *((BYTE*)(fs->win+510)+1)=(BYTE)((WORD)(0xAA55)>>8);
N            ST_DWORD(fs->win+FSI_LeadSig, 0x41615252);
X            *(BYTE*)(fs->win+0)=(BYTE)(0x41615252); *((BYTE*)(fs->win+0)+1)=(BYTE)((WORD)(0x41615252)>>8); *((BYTE*)(fs->win+0)+2)=(BYTE)((DWORD)(0x41615252)>>16); *((BYTE*)(fs->win+0)+3)=(BYTE)((DWORD)(0x41615252)>>24);
N            ST_DWORD(fs->win+FSI_StrucSig, 0x61417272);
X            *(BYTE*)(fs->win+484)=(BYTE)(0x61417272); *((BYTE*)(fs->win+484)+1)=(BYTE)((WORD)(0x61417272)>>8); *((BYTE*)(fs->win+484)+2)=(BYTE)((DWORD)(0x61417272)>>16); *((BYTE*)(fs->win+484)+3)=(BYTE)((DWORD)(0x61417272)>>24);
N            ST_DWORD(fs->win+FSI_Free_Count, fs->free_clust);
X            *(BYTE*)(fs->win+488)=(BYTE)(fs->free_clust); *((BYTE*)(fs->win+488)+1)=(BYTE)((WORD)(fs->free_clust)>>8); *((BYTE*)(fs->win+488)+2)=(BYTE)((DWORD)(fs->free_clust)>>16); *((BYTE*)(fs->win+488)+3)=(BYTE)((DWORD)(fs->free_clust)>>24);
N            ST_DWORD(fs->win+FSI_Nxt_Free, fs->last_clust);
X            *(BYTE*)(fs->win+492)=(BYTE)(fs->last_clust); *((BYTE*)(fs->win+492)+1)=(BYTE)((WORD)(fs->last_clust)>>8); *((BYTE*)(fs->win+492)+2)=(BYTE)((DWORD)(fs->last_clust)>>16); *((BYTE*)(fs->win+492)+3)=(BYTE)((DWORD)(fs->last_clust)>>24);
N            /* Write it into the FSInfo sector */
N            disk_write(fs->drv, fs->win, fs->fsi_sector, 1);
N            fs->fsi_flag = 0;
N        }
N        /* Make sure that no pending write process in the physical drive */
N        if (disk_ioctl(fs->drv, CTRL_SYNC, 0) != RES_OK)
X        if (disk_ioctl(fs->drv, 0, 0) != RES_OK)
N            res = FR_DISK_ERR;
N    }
N
N    return res;
N}
N#endif
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Get sector# from cluster#                                             */
N/*-----------------------------------------------------------------------*/
N
N
NDWORD clust2sect (  /* !=0: Sector number, 0: Failed - invalid cluster# */
N    FATFS *fs,      /* File system object */
N    DWORD clst      /* Cluster# to be converted */
N)
N{
N    clst -= 2;
N    if (clst >= (fs->n_fatent - 2)) return 0;       /* Invalid cluster# */
N    return clst * fs->csize + fs->database;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* FAT access - Read value of a FAT entry                                */
N/*-----------------------------------------------------------------------*/
N
N
NDWORD get_fat ( /* 0xFFFFFFFF:Disk error, 1:Internal error, Else:Cluster status */
N    FATFS *fs,  /* File system object */
N    DWORD clst  /* Cluster# to get the link information */
N)
N{
N    UINT wc, bc;
N    BYTE *p;
N
N
N    if (clst < 2 || clst >= fs->n_fatent)   /* Check range */
N        return 1;
N
N    switch (fs->fs_type) {
N    case FS_FAT12 :
X    case 1 :
N        bc = (UINT)clst; bc += bc / 2;
N        if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
X        if (move_window(fs, fs->fatbase + (bc / 512U))) break;
N        wc = fs->win[bc % SS(fs)]; bc++;
X        wc = fs->win[bc % 512U]; bc++;
N        if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
X        if (move_window(fs, fs->fatbase + (bc / 512U))) break;
N        wc |= fs->win[bc % SS(fs)] << 8;
X        wc |= fs->win[bc % 512U] << 8;
N        return (clst & 1) ? (wc >> 4) : (wc & 0xFFF);
N
N    case FS_FAT16 :
X    case 2 :
N        if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)))) break;
X        if (move_window(fs, fs->fatbase + (clst / (512U / 2)))) break;
N        p = &fs->win[clst * 2 % SS(fs)];
X        p = &fs->win[clst * 2 % 512U];
N        return LD_WORD(p);
X        return (WORD)(((WORD)*((BYTE*)(p)+1)<<8)|(WORD)*(BYTE*)(p));
N
N    case FS_FAT32 :
X    case 3 :
N        if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)))) break;
X        if (move_window(fs, fs->fatbase + (clst / (512U / 4)))) break;
N        p = &fs->win[clst * 4 % SS(fs)];
X        p = &fs->win[clst * 4 % 512U];
N        return LD_DWORD(p) & 0x0FFFFFFF;
X        return (DWORD)(((DWORD)*((BYTE*)(p)+3)<<24)|((DWORD)*((BYTE*)(p)+2)<<16)|((WORD)*((BYTE*)(p)+1)<<8)| *(BYTE*)(p)) & 0x0FFFFFFF;
N    }
N
N    return 0xFFFFFFFF;  /* An error occurred at the disk I/O layer */
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* FAT access - Change value of a FAT entry                              */
N/*-----------------------------------------------------------------------*/
N#if !_FS_READONLY
X#if !0
N
NFRESULT put_fat (
N    FATFS *fs,  /* File system object */
N    DWORD clst, /* Cluster# to be changed in range of 2 to fs->n_fatent - 1 */
N    DWORD val   /* New value to mark the cluster */
N)
N{
N    UINT bc;
N    BYTE *p;
N    FRESULT res;
N
N
N    if (clst < 2 || clst >= fs->n_fatent) { /* Check range */
N        res = FR_INT_ERR;
N
N    } else {
N        switch (fs->fs_type) {
N        case FS_FAT12 :
X        case 1 :
N            bc = (UINT)clst; bc += bc / 2;
N            res = move_window(fs, fs->fatbase + (bc / SS(fs)));
X            res = move_window(fs, fs->fatbase + (bc / 512U));
N            if (res != FR_OK) break;
N            p = &fs->win[bc % SS(fs)];
X            p = &fs->win[bc % 512U];
N            *p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;
N            bc++;
N            fs->wflag = 1;
N            res = move_window(fs, fs->fatbase + (bc / SS(fs)));
X            res = move_window(fs, fs->fatbase + (bc / 512U));
N            if (res != FR_OK) break;
N            p = &fs->win[bc % SS(fs)];
X            p = &fs->win[bc % 512U];
N            *p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));
N            break;
N
N        case FS_FAT16 :
X        case 2 :
N            res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)));
X            res = move_window(fs, fs->fatbase + (clst / (512U / 2)));
N            if (res != FR_OK) break;
N            p = &fs->win[clst * 2 % SS(fs)];
X            p = &fs->win[clst * 2 % 512U];
N            ST_WORD(p, (WORD)val);
X            *(BYTE*)(p)=(BYTE)((WORD)val); *((BYTE*)(p)+1)=(BYTE)((WORD)((WORD)val)>>8);
N            break;
N
N        case FS_FAT32 :
X        case 3 :
N            res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
X            res = move_window(fs, fs->fatbase + (clst / (512U / 4)));
N            if (res != FR_OK) break;
N            p = &fs->win[clst * 4 % SS(fs)];
X            p = &fs->win[clst * 4 % 512U];
N            val |= LD_DWORD(p) & 0xF0000000;
X            val |= (DWORD)(((DWORD)*((BYTE*)(p)+3)<<24)|((DWORD)*((BYTE*)(p)+2)<<16)|((WORD)*((BYTE*)(p)+1)<<8)| *(BYTE*)(p)) & 0xF0000000;
N            ST_DWORD(p, val);
X            *(BYTE*)(p)=(BYTE)(val); *((BYTE*)(p)+1)=(BYTE)((WORD)(val)>>8); *((BYTE*)(p)+2)=(BYTE)((DWORD)(val)>>16); *((BYTE*)(p)+3)=(BYTE)((DWORD)(val)>>24);
N            break;
N
N        default :
N            res = FR_INT_ERR;
N        }
N        fs->wflag = 1;
N    }
N
N    return res;
N}
N#endif /* !_FS_READONLY */
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* FAT handling - Remove a cluster chain                                 */
N/*-----------------------------------------------------------------------*/
N#if !_FS_READONLY
X#if !0
Nstatic
NFRESULT remove_chain (
N    FATFS *fs,          /* File system object */
N    DWORD clst          /* Cluster# to remove a chain from */
N)
N{
N    FRESULT res;
N    DWORD nxt;
N#if _USE_ERASE
X#if 0
S    DWORD scl = clst, ecl = clst, rt[2];
N#endif
N
N    if (clst < 2 || clst >= fs->n_fatent) { /* Check range */
N        res = FR_INT_ERR;
N
N    } else {
N        res = FR_OK;
N        while (clst < fs->n_fatent) {           /* Not a last link? */
N            nxt = get_fat(fs, clst);            /* Get cluster status */
N            if (nxt == 0) break;                /* Empty cluster? */
N            if (nxt == 1) { res = FR_INT_ERR; break; }  /* Internal error? */
N            if (nxt == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }    /* Disk error? */
N            res = put_fat(fs, clst, 0);         /* Mark the cluster "empty" */
N            if (res != FR_OK) break;
N            if (fs->free_clust != 0xFFFFFFFF) { /* Update FSInfo */
N                fs->free_clust++;
N                fs->fsi_flag = 1;
N            }
N#if _USE_ERASE
X#if 0
S            if (ecl + 1 == nxt) {   /* Is next cluster contiguous? */
S                ecl = nxt;
S            } else {                /* End of contiguous clusters */
S                rt[0] = clust2sect(fs, scl);                    /* Start sector */
S                rt[1] = clust2sect(fs, ecl) + fs->csize - 1;    /* End sector */
S                disk_ioctl(fs->drv, CTRL_ERASE_SECTOR, rt);     /* Erase the block */
S                scl = ecl = nxt;
S            }
N#endif
N            clst = nxt; /* Next cluster */
N        }
N    }
N
N    return res;
N}
N#endif
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* FAT handling - Stretch or Create a cluster chain                      */
N/*-----------------------------------------------------------------------*/
N#if !_FS_READONLY
X#if !0
Nstatic
NDWORD create_chain (    /* 0:No free cluster, 1:Internal error, 0xFFFFFFFF:Disk error, >=2:New cluster# */
N    FATFS *fs,          /* File system object */
N    DWORD clst          /* Cluster# to stretch. 0 means create a new chain. */
N)
N{
N    DWORD cs, ncl, scl;
N    FRESULT res;
N
N
N    if (clst == 0) {        /* Create a new chain */
N        scl = fs->last_clust;           /* Get suggested start point */
N        if (!scl || scl >= fs->n_fatent) scl = 1;
N    }
N    else {                  /* Stretch the current chain */
N        cs = get_fat(fs, clst);         /* Check the cluster status */
N        if (cs < 2) return 1;           /* It is an invalid cluster */
N        if (cs < fs->n_fatent) return cs;   /* It is already followed by next cluster */
N        scl = clst;
N    }
N
N    ncl = scl;              /* Start cluster */
N    for (;;) {
N        ncl++;                          /* Next cluster */
N        if (ncl >= fs->n_fatent) {      /* Wrap around */
N            ncl = 2;
N            if (ncl > scl) return 0;    /* No free cluster */
N        }
N        cs = get_fat(fs, ncl);          /* Get the cluster status */
N        if (cs == 0) break;             /* Found a free cluster */
N        if (cs == 0xFFFFFFFF || cs == 1)/* An error occurred */
N            return cs;
N        if (ncl == scl) return 0;       /* No free cluster */
N    }
N
N    res = put_fat(fs, ncl, 0x0FFFFFFF); /* Mark the new cluster "last link" */
N    if (res == FR_OK && clst != 0) {
N        res = put_fat(fs, clst, ncl);   /* Link it to the previous one if needed */
N    }
N    if (res == FR_OK) {
N        fs->last_clust = ncl;           /* Update FSINFO */
N        if (fs->free_clust != 0xFFFFFFFF) {
N            fs->free_clust--;
N            fs->fsi_flag = 1;
N        }
N    } else {
N        ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;
N    }
N
N    return ncl;     /* Return new cluster number or error code */
N}
N#endif /* !_FS_READONLY */
N
N
N
N/*-----------------------------------------------------------------------*/
N/* FAT handling - Convert offset into cluster with link map table        */
N/*-----------------------------------------------------------------------*/
N
N#if _USE_FASTSEEK
X#if 0
Sstatic
SDWORD clmt_clust (  /* <2:Error, >=2:Cluster number */
S    FIL* fp,        /* Pointer to the file object */
S    DWORD ofs       /* File offset to be converted to cluster# */
S)
S{
S    DWORD cl, ncl, *tbl;
S
S
S    tbl = fp->cltbl + 1;    /* Top of CLMT */
S    cl = ofs / SS(fp->fs) / fp->fs->csize;  /* Cluster order from top of the file */
S    for (;;) {
S        ncl = *tbl++;           /* Number of cluters in the fragment */
S        if (!ncl) return 0;     /* End of table? (error) */
S        if (cl < ncl) break;    /* In this fragment? */
S        cl -= ncl; tbl++;       /* Next fragment */
S    }
S    return cl + *tbl;   /* Return the cluster number */
S}
N#endif  /* _USE_FASTSEEK */
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Directory handling - Set directory index                              */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NFRESULT dir_sdi (
N    DIR *dj,        /* Pointer to directory object */
N    WORD idx        /* Index of directory table */
N)
N{
N    DWORD clst;
N    WORD ic;
N
N
N    dj->index = idx;
N    clst = dj->sclust;
N    if (clst == 1 || clst >= dj->fs->n_fatent)  /* Check start cluster range */
N        return FR_INT_ERR;
N    if (!clst && dj->fs->fs_type == FS_FAT32)   /* Replace cluster# 0 with root cluster# if in FAT32 */
X    if (!clst && dj->fs->fs_type == 3)    
N        clst = dj->fs->dirbase;
N
N    if (clst == 0) {    /* Static table (root-dir in FAT12/16) */
N        dj->clust = clst;
N        if (idx >= dj->fs->n_rootdir)       /* Index is out of range */
N            return FR_INT_ERR;
N        dj->sect = dj->fs->dirbase + idx / (SS(dj->fs) / SZ_DIR);   /* Sector# */
X        dj->sect = dj->fs->dirbase + idx / (512U / 32);    
N    }
N    else {              /* Dynamic table (sub-dirs or root-dir in FAT32) */
N        ic = SS(dj->fs) / SZ_DIR * dj->fs->csize;   /* Entries per cluster */
X        ic = 512U / 32 * dj->fs->csize;    
N        while (idx >= ic) { /* Follow cluster chain */
N            clst = get_fat(dj->fs, clst);               /* Get next cluster */
N            if (clst == 0xFFFFFFFF) return FR_DISK_ERR; /* Disk error */
N            if (clst < 2 || clst >= dj->fs->n_fatent)   /* Reached to end of table or int error */
N                return FR_INT_ERR;
N            idx -= ic;
N        }
N        dj->clust = clst;
N        dj->sect = clust2sect(dj->fs, clst) + idx / (SS(dj->fs) / SZ_DIR);  /* Sector# */
X        dj->sect = clust2sect(dj->fs, clst) + idx / (512U / 32);   
N    }
N
N    dj->dir = dj->fs->win + (idx % (SS(dj->fs) / SZ_DIR)) * SZ_DIR; /* Ptr to the entry in the sector */
X    dj->dir = dj->fs->win + (idx % (512U / 32)) * 32;  
N
N    return FR_OK;   /* Seek succeeded */
R "../ff.c" 1111 12 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1117 17 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Directory handling - Move directory table index next                  */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NFRESULT dir_next (  /* FR_OK:Succeeded, FR_NO_FILE:End of table, FR_DENIED:Could not stretch */
N    DIR *dj,        /* Pointer to the directory object */
N    int stretch     /* 0: Do not stretch table, 1: Stretch table if needed */
N)
N{
N    DWORD clst;
N    WORD i;
N
N
N    stretch = stretch;      /* To suppress warning on read-only cfg. */
N    i = dj->index + 1;
N    if (!i || !dj->sect)    /* Report EOT when index has reached 65535 */
N        return FR_NO_FILE;
N
N    if (!(i % (SS(dj->fs) / SZ_DIR))) { /* Sector changed? */
X    if (!(i % (512U / 32))) {  
N        dj->sect++;                 /* Next sector */
N
N        if (dj->clust == 0) {   /* Static table */
N            if (i >= dj->fs->n_rootdir) /* Report EOT when end of table */
N                return FR_NO_FILE;
N        }
N        else {                  /* Dynamic table */
N            if (((i / (SS(dj->fs) / SZ_DIR)) & (dj->fs->csize - 1)) == 0) { /* Cluster changed? */
X            if (((i / (512U / 32)) & (dj->fs->csize - 1)) == 0) {  
N                clst = get_fat(dj->fs, dj->clust);              /* Get next cluster */
N                if (clst <= 1) return FR_INT_ERR;
N                if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
N                if (clst >= dj->fs->n_fatent) {                 /* When it reached end of dynamic table */
N#if !_FS_READONLY
X#if !0
N                    BYTE c;
N                    if (!stretch) return FR_NO_FILE;            /* When do not stretch, report EOT */
N                    clst = create_chain(dj->fs, dj->clust);     /* Stretch cluster chain */
N                    if (clst == 0) return FR_DENIED;            /* No free cluster */
N                    if (clst == 1) return FR_INT_ERR;
N                    if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
N                    /* Clean-up stretched table */
N                    if (sync_window(dj->fs)) return FR_DISK_ERR;    /* Flush active window */
N                    mem_set(dj->fs->win, 0, SS(dj->fs));            /* Clear window buffer */
X                    mem_set(dj->fs->win, 0, 512U);             
N                    dj->fs->winsect = clust2sect(dj->fs, clst); /* Cluster start sector */
N                    for (c = 0; c < dj->fs->csize; c++) {       /* Fill the new cluster with 0 */
N                        dj->fs->wflag = 1;
N                        if (sync_window(dj->fs)) return FR_DISK_ERR;
N                        dj->fs->winsect++;
N                    }
N                    dj->fs->winsect -= c;                       /* Rewind window address */
N#else
S                    return FR_NO_FILE;          /* Report EOT */
N#endif
N                }
N                dj->clust = clst;               /* Initialize data for new cluster */
N                dj->sect = clust2sect(dj->fs, clst);
N            }
N        }
N    }
N
N    dj->index = i;
N    dj->dir = dj->fs->win + (i % (SS(dj->fs) / SZ_DIR)) * SZ_DIR;
X    dj->dir = dj->fs->win + (i % (512U / 32)) * 32;
N
N    return FR_OK;
R "../ff.c" 1146 7 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1174 53 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1174 53 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Directory handling - Reserve directory entry                          */
N/*-----------------------------------------------------------------------*/
N
N#if !_FS_READONLY
X#if !0
Nstatic
NFRESULT dir_alloc (
N    DIR* dj,    /* Pointer to the directory object */
N    UINT nent   /* Number of contiguous entries to allocate (1-21) */
N)
N{
N    FRESULT res;
N    UINT n;
N
N
N    res = dir_sdi(dj, 0);
N    if (res == FR_OK) {
N        n = 0;
N        do {
N            res = move_window(dj->fs, dj->sect);
N            if (res != FR_OK) break;
N            if (dj->dir[0] == DDE || dj->dir[0] == 0) { /* Is it a blank entry? */
X            if (dj->dir[0] == 0xE5 || dj->dir[0] == 0) {  
N                if (++n == nent) break; /* A block of contiguous entry is found */
N            } else {
N                n = 0;                  /* Not a blank entry. Restart to search */
N            }
N            res = dir_next(dj, 1);      /* Next entry with table stretch enabled */
N        } while (res == FR_OK);
N    }
N    return res;
N}
N#endif
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Directory handling - Load/Store start cluster number                  */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NDWORD ld_clust (
N    FATFS *fs,  /* Pointer to the fs object */
N    BYTE *dir   /* Pointer to the directory entry */
N)
N{
N    DWORD cl;
N
N    cl = LD_WORD(dir+DIR_FstClusLO);
X    cl = (WORD)(((WORD)*((BYTE*)(dir+26)+1)<<8)|(WORD)*(BYTE*)(dir+26));
N    if (fs->fs_type == FS_FAT32)
X    if (fs->fs_type == 3)
N        cl |= (DWORD)LD_WORD(dir+DIR_FstClusHI) << 16;
X        cl |= (DWORD)(WORD)(((WORD)*((BYTE*)(dir+20)+1)<<8)|(WORD)*(BYTE*)(dir+20)) << 16;
N
N    return cl;
N}
N
N
N#if !_FS_READONLY
X#if !0
Nstatic
Nvoid st_clust (
N    BYTE *dir,  /* Pointer to the directory entry */
N    DWORD cl    /* Value to be set */
N)
N{
N    ST_WORD(dir+DIR_FstClusLO, cl);
X    *(BYTE*)(dir+26)=(BYTE)(cl); *((BYTE*)(dir+26)+1)=(BYTE)((WORD)(cl)>>8);
N    ST_WORD(dir+DIR_FstClusHI, cl >> 16);
X    *(BYTE*)(dir+20)=(BYTE)(cl >> 16); *((BYTE*)(dir+20)+1)=(BYTE)((WORD)(cl >> 16)>>8);
N}
N#endif
N
N
N
N/*-----------------------------------------------------------------------*/
N/* LFN handling - Test/Pick/Fit an LFN segment from/to directory entry   */
N/*-----------------------------------------------------------------------*/
N#if _USE_LFN
X#if 0
Sstatic
Sconst BYTE LfnOfs[] = {1,3,5,7,9,14,16,18,20,22,24,28,30};  /* Offset of LFN chars in the directory entry */
S
S
Sstatic
Sint cmp_lfn (           /* 1:Matched, 0:Not matched */
S    WCHAR *lfnbuf,      /* Pointer to the LFN to be compared */
S    BYTE *dir           /* Pointer to the directory entry containing a part of LFN */
S)
S{
S    UINT i, s;
S    WCHAR wc, uc;
S
S
S    i = ((dir[LDIR_Ord] & ~LLE) - 1) * 13;  /* Get offset in the LFN buffer */
S    s = 0; wc = 1;
S    do {
S        uc = LD_WORD(dir+LfnOfs[s]);    /* Pick an LFN character from the entry */
S        if (wc) {   /* Last char has not been processed */
S            wc = ff_wtoupper(uc);       /* Convert it to upper case */
S            if (i >= _MAX_LFN || wc != ff_wtoupper(lfnbuf[i++]))    /* Compare it */
S                return 0;               /* Not matched */
S        } else {
S            if (uc != 0xFFFF) return 0; /* Check filler */
S        }
S    } while (++s < 13);             /* Repeat until all chars in the entry are checked */
S
S    if ((dir[LDIR_Ord] & LLE) && wc && lfnbuf[i])   /* Last segment matched but different length */
S        return 0;
S
S    return 1;                       /* The part of LFN matched */
S}
S
S
S
Sstatic
Sint pick_lfn (          /* 1:Succeeded, 0:Buffer overflow */
S    WCHAR *lfnbuf,      /* Pointer to the Unicode-LFN buffer */
S    BYTE *dir           /* Pointer to the directory entry */
S)
S{
S    UINT i, s;
S    WCHAR wc, uc;
S
S
S    i = ((dir[LDIR_Ord] & 0x3F) - 1) * 13;  /* Offset in the LFN buffer */
S
S    s = 0; wc = 1;
S    do {
S        uc = LD_WORD(dir+LfnOfs[s]);        /* Pick an LFN character from the entry */
S        if (wc) {   /* Last char has not been processed */
S            if (i >= _MAX_LFN) return 0;    /* Buffer overflow? */
S            lfnbuf[i++] = wc = uc;          /* Store it */
S        } else {
S            if (uc != 0xFFFF) return 0;     /* Check filler */
S        }
S    } while (++s < 13);                     /* Read all character in the entry */
S
S    if (dir[LDIR_Ord] & LLE) {              /* Put terminator if it is the last LFN part */
S        if (i >= _MAX_LFN) return 0;        /* Buffer overflow? */
S        lfnbuf[i] = 0;
S    }
S
S    return 1;
S}
S
S
S#if !_FS_READONLY
Sstatic
Svoid fit_lfn (
S    const WCHAR *lfnbuf,    /* Pointer to the LFN buffer */
S    BYTE *dir,              /* Pointer to the directory entry */
S    BYTE ord,               /* LFN order (1-20) */
S    BYTE sum                /* SFN sum */
S)
S{
S    UINT i, s;
S    WCHAR wc;
S
S
S    dir[LDIR_Chksum] = sum;         /* Set check sum */
S    dir[LDIR_Attr] = AM_LFN;        /* Set attribute. LFN entry */
S    dir[LDIR_Type] = 0;
S    ST_WORD(dir+LDIR_FstClusLO, 0);
S
S    i = (ord - 1) * 13;             /* Get offset in the LFN buffer */
S    s = wc = 0;
S    do {
S        if (wc != 0xFFFF) wc = lfnbuf[i++]; /* Get an effective char */
S        ST_WORD(dir+LfnOfs[s], wc); /* Put it */
S        if (!wc) wc = 0xFFFF;       /* Padding chars following last char */
S    } while (++s < 13);
S    if (wc == 0xFFFF || !lfnbuf[i]) ord |= LLE; /* Bottom LFN part is the start of LFN sequence */
S    dir[LDIR_Ord] = ord;            /* Set the LFN order */
S}
S
S#endif
N#endif
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Create numbered name                                                  */
N/*-----------------------------------------------------------------------*/
N#if _USE_LFN
X#if 0
Svoid gen_numname (
S    BYTE *dst,          /* Pointer to generated SFN */
S    const BYTE *src,    /* Pointer to source SFN to be modified */
S    const WCHAR *lfn,   /* Pointer to LFN */
S    WORD seq            /* Sequence number */
S)
S{
S    BYTE ns[8], c;
S    UINT i, j;
S
S
S    mem_cpy(dst, src, 11);
S
S    if (seq > 5) {  /* On many collisions, generate a hash number instead of sequential number */
S        do seq = (seq >> 1) + (seq << 15) + (WORD)*lfn++; while (*lfn);
S    }
S
S    /* itoa (hexdecimal) */
S    i = 7;
S    do {
S        c = (seq % 16) + '0';
S        if (c > '9') c += 7;
S        ns[i--] = c;
S        seq /= 16;
S    } while (seq);
S    ns[i] = '~';
S
S    /* Append the number */
S    for (j = 0; j < i && dst[j] != ' '; j++) {
S        if (IsDBCS1(dst[j])) {
S            if (j == i - 1) break;
S            j++;
S        }
S    }
S    do {
S        dst[j++] = (i < 8) ? ns[i++] : ' ';
S    } while (j < 8);
S}
N#endif
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Calculate sum of an SFN                                               */
N/*-----------------------------------------------------------------------*/
N#if _USE_LFN
X#if 0
Sstatic
SBYTE sum_sfn (
S    const BYTE *dir     /* Ptr to directory entry */
S)
S{
S    BYTE sum = 0;
S    UINT n = 11;
S
S    do sum = (sum >> 1) + (sum << 7) + *dir++; while (--n);
S    return sum;
S}
N#endif
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Directory handling - Find an object in the directory                  */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NFRESULT dir_find (
N    DIR *dj         /* Pointer to the directory object linked to the file name */
N)
N{
N    FRESULT res;
N    BYTE c, *dir;
N#if _USE_LFN
X#if 0
S    BYTE a, ord, sum;
N#endif
N
N    res = dir_sdi(dj, 0);           /* Rewind directory object */
N    if (res != FR_OK) return res;
N
N#if _USE_LFN
X#if 0
S    ord = sum = 0xFF;
N#endif
N    do {
N        res = move_window(dj->fs, dj->sect);
N        if (res != FR_OK) break;
N        dir = dj->dir;                  /* Ptr to the directory entry of current index */
N        c = dir[DIR_Name];
X        c = dir[0];
N        if (c == 0) { res = FR_NO_FILE; break; }    /* Reached to end of table */
N#if _USE_LFN    /* LFN configuration */
X#if 0     
S        a = dir[DIR_Attr] & AM_MASK;
S        if (c == DDE || ((a & AM_VOL) && a != AM_LFN)) {    /* An entry without valid data */
S            ord = 0xFF;
S        } else {
S            if (a == AM_LFN) {          /* An LFN entry is found */
S                if (dj->lfn) {
S                    if (c & LLE) {      /* Is it start of LFN sequence? */
S                        sum = dir[LDIR_Chksum];
S                        c &= ~LLE; ord = c; /* LFN start order */
S                        dj->lfn_idx = dj->index;
S                    }
S                    /* Check validity of the LFN entry and compare it with given name */
S                    ord = (c == ord && sum == dir[LDIR_Chksum] && cmp_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
S                }
S            } else {                    /* An SFN entry is found */
S                if (!ord && sum == sum_sfn(dir)) break; /* LFN matched? */
S                ord = 0xFF; dj->lfn_idx = 0xFFFF;   /* Reset LFN sequence */
S                if (!(dj->fn[NS] & NS_LOSS) && !mem_cmp(dir, dj->fn, 11)) break;    /* SFN matched? */
S            }
S        }
N#else       /* Non LFN configuration */
N        if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) /* Is it a valid entry? */
X        if (!(dir[11] & 0x08) && !mem_cmp(dir, dj->fn, 11))  
N            break;
N#endif
N        res = dir_next(dj, 0);      /* Next entry */
N    } while (res == FR_OK);
N
N    return res;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Read an object from the directory                                     */
N/*-----------------------------------------------------------------------*/
N#if _FS_MINIMIZE <= 1 || _USE_LABEL || _FS_RPATH >= 2
X#if 0 <= 1 || 0 || 0 >= 2
Nstatic
NFRESULT dir_read (
N    DIR *dj,        /* Pointer to the directory object */
N    int vol         /* Filtered by 0:file/dir or 1:volume label */
N)
N{
N    FRESULT res;
N    BYTE a, c, *dir;
N#if _USE_LFN
X#if 0
S    BYTE ord = 0xFF, sum = 0xFF;
N#endif
N
N    res = FR_NO_FILE;
N    while (dj->sect) {
N        res = move_window(dj->fs, dj->sect);
N        if (res != FR_OK) break;
N        dir = dj->dir;                  /* Ptr to the directory entry of current index */
N        c = dir[DIR_Name];
X        c = dir[0];
N        if (c == 0) { res = FR_NO_FILE; break; }    /* Reached to end of table */
N        a = dir[DIR_Attr] & AM_MASK;
X        a = dir[11] & 0x3F;
N#if _USE_LFN    /* LFN configuration */
X#if 0     
S        if (c == DDE || (!_FS_RPATH && c == '.') || (a == AM_VOL) != vol) { /* An entry without valid data */
S            ord = 0xFF;
S        } else {
S            if (a == AM_LFN) {          /* An LFN entry is found */
S                if (c & LLE) {          /* Is it start of LFN sequence? */
S                    sum = dir[LDIR_Chksum];
S                    c &= ~LLE; ord = c;
S                    dj->lfn_idx = dj->index;
S                }
S                /* Check LFN validity and capture it */
S                ord = (c == ord && sum == dir[LDIR_Chksum] && pick_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
S            } else {                    /* An SFN entry is found */
S                if (ord || sum != sum_sfn(dir)) /* Is there a valid LFN? */
S                    dj->lfn_idx = 0xFFFF;       /* It has no LFN. */
S                break;
S            }
S        }
N#else       /* Non LFN configuration */
N        if (c != DDE && (_FS_RPATH || c != '.') && a != AM_LFN && (a == AM_VOL) == vol) /* Is it a valid entry? */
X        if (c != 0xE5 && (0 || c != '.') && a != 0x0F && (a == 0x08) == vol)  
N            break;
N#endif
N        res = dir_next(dj, 0);              /* Next entry */
N        if (res != FR_OK) break;
N    }
N
N    if (res != FR_OK) dj->sect = 0;
N
N    return res;
R "../ff.c" 1524 11 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N#endif  /* _FS_MINIMIZE <= 1 || _USE_LABEL || _FS_RPATH >= 2 */
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Register an object to the directory                                   */
N/*-----------------------------------------------------------------------*/
N#if !_FS_READONLY
X#if !0
Nstatic
NFRESULT dir_register (  /* FR_OK:Successful, FR_DENIED:No free entry or too many SFN collision, FR_DISK_ERR:Disk error */
N    DIR *dj             /* Target directory with object name to be created */
N)
N{
N    FRESULT res;
N#if _USE_LFN    /* LFN configuration */
X#if 0     
S    WORD n, ne;
S    BYTE sn[12], *fn, sum;
S    WCHAR *lfn;
S
S
S    fn = dj->fn; lfn = dj->lfn;
S    mem_cpy(sn, fn, 12);
S
S    if (_FS_RPATH && (sn[NS] & NS_DOT))     /* Cannot create dot entry */
S        return FR_INVALID_NAME;
S
S    if (sn[NS] & NS_LOSS) {         /* When LFN is out of 8.3 format, generate a numbered name */
S        fn[NS] = 0; dj->lfn = 0;            /* Find only SFN */
S        for (n = 1; n < 100; n++) {
S            gen_numname(fn, sn, lfn, n);    /* Generate a numbered name */
S            res = dir_find(dj);             /* Check if the name collides with existing SFN */
S            if (res != FR_OK) break;
S        }
S        if (n == 100) return FR_DENIED;     /* Abort if too many collisions */
S        if (res != FR_NO_FILE) return res;  /* Abort if the result is other than 'not collided' */
S        fn[NS] = sn[NS]; dj->lfn = lfn;
S    }
S
S    if (sn[NS] & NS_LFN) {          /* When LFN is to be created, allocate entries for an SFN + LFNs. */
S        for (n = 0; lfn[n]; n++) ;
S        ne = (n + 25) / 13;
S    } else {                        /* Otherwise allocate an entry for an SFN  */
S        ne = 1;
S    }
S    res = dir_alloc(dj, ne);        /* Allocate entries */
S
S    if (res == FR_OK && --ne) {     /* Set LFN entry if needed */
S        res = dir_sdi(dj, (WORD)(dj->index - ne));
S        if (res == FR_OK) {
S            sum = sum_sfn(dj->fn);  /* Sum value of the SFN tied to the LFN */
S            do {                    /* Store LFN entries in bottom first */
S                res = move_window(dj->fs, dj->sect);
S                if (res != FR_OK) break;
S                fit_lfn(dj->lfn, dj->dir, (BYTE)ne, sum);
S                dj->fs->wflag = 1;
S                res = dir_next(dj, 0);  /* Next entry */
S            } while (res == FR_OK && --ne);
S        }
S    }
N#else   /* Non LFN configuration */
N    res = dir_alloc(dj, 1);     /* Allocate an entry for SFN */
N#endif
N
N    if (res == FR_OK) {             /* Set SFN entry */
N        res = move_window(dj->fs, dj->sect);
N        if (res == FR_OK) {
N            mem_set(dj->dir, 0, SZ_DIR);    /* Clean the entry */
X            mem_set(dj->dir, 0, 32);     
N            mem_cpy(dj->dir, dj->fn, 11);   /* Put SFN */
N#if _USE_LFN
X#if 0
S            dj->dir[DIR_NTres] = *(dj->fn+NS) & (NS_BODY | NS_EXT); /* Put NT flag */
N#endif
N            dj->fs->wflag = 1;
N        }
N    }
N
N    return res;
N}
N#endif /* !_FS_READONLY */
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Remove an object from the directory                                   */
N/*-----------------------------------------------------------------------*/
N#if !_FS_READONLY && !_FS_MINIMIZE
X#if !0 && !0
Nstatic
NFRESULT dir_remove (    /* FR_OK: Successful, FR_DISK_ERR: A disk error */
N    DIR *dj             /* Directory object pointing the entry to be removed */
N)
N{
N    FRESULT res;
N#if _USE_LFN    /* LFN configuration */
X#if 0     
S    WORD i;
S
S    i = dj->index;  /* SFN index */
S    res = dir_sdi(dj, (WORD)((dj->lfn_idx == 0xFFFF) ? i : dj->lfn_idx));   /* Goto the SFN or top of the LFN entries */
S    if (res == FR_OK) {
S        do {
S            res = move_window(dj->fs, dj->sect);
S            if (res != FR_OK) break;
S            *dj->dir = DDE;         /* Mark the entry "deleted" */
S            dj->fs->wflag = 1;
S            if (dj->index >= i) break;  /* When reached SFN, all entries of the object has been deleted. */
S            res = dir_next(dj, 0);      /* Next entry */
S        } while (res == FR_OK);
S        if (res == FR_NO_FILE) res = FR_INT_ERR;
S    }
S
N#else           /* Non LFN configuration */
N    res = dir_sdi(dj, dj->index);
N    if (res == FR_OK) {
N        res = move_window(dj->fs, dj->sect);
N        if (res == FR_OK) {
N            *dj->dir = DDE;         /* Mark the entry "deleted" */
X            *dj->dir = 0xE5;          
N            dj->fs->wflag = 1;
N        }
N    }
N#endif
N
N    return res;
N}
N#endif /* !_FS_READONLY */
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Pick a segment and create the object name in directory form           */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NFRESULT create_name (
N    DIR *dj,            /* Pointer to the directory object */
N    const TCHAR **path  /* Pointer to pointer to the segment in the path string */
N)
N{
N#if _USE_LFN    /* LFN configuration */
X#if 0     
S    BYTE b, cf;
S    WCHAR w, *lfn;
S    UINT i, ni, si, di;
S    const TCHAR *p;
S
S    /* Create LFN in Unicode */
S    for (p = *path; *p == '/' || *p == '\\'; p++) ; /* Strip duplicated separator */
S    lfn = dj->lfn;
S    si = di = 0;
S    for (;;) {
S        w = p[si++];                    /* Get a character */
S        if (w < ' ' || w == '/' || w == '\\') break;    /* Break on end of segment */
S        if (di >= _MAX_LFN)             /* Reject too long name */
S            return FR_INVALID_NAME;
S#if !_LFN_UNICODE
S        w &= 0xFF;
S        if (IsDBCS1(w)) {               /* Check if it is a DBC 1st byte (always false on SBCS cfg) */
S            b = (BYTE)p[si++];          /* Get 2nd byte */
S            if (!IsDBCS2(b))
S                return FR_INVALID_NAME; /* Reject invalid sequence */
S            w = (w << 8) + b;           /* Create a DBC */
S        }
S        w = ff_convert(w, 1);           /* Convert ANSI/OEM to Unicode */
S        if (!w) return FR_INVALID_NAME; /* Reject invalid code */
S#endif
S        if (w < 0x80 && chk_chr("\"*:<>\?|\x7F", w)) /* Reject illegal chars for LFN */
S            return FR_INVALID_NAME;
S        lfn[di++] = w;                  /* Store the Unicode char */
S    }
S    *path = &p[si];                     /* Return pointer to the next segment */
S    cf = (w < ' ') ? NS_LAST : 0;       /* Set last segment flag if end of path */
S#if _FS_RPATH
S    if ((di == 1 && lfn[di-1] == '.') || /* Is this a dot entry? */
S        (di == 2 && lfn[di-1] == '.' && lfn[di-2] == '.')) {
S        lfn[di] = 0;
S        for (i = 0; i < 11; i++)
S            dj->fn[i] = (i < di) ? '.' : ' ';
S        dj->fn[i] = cf | NS_DOT;        /* This is a dot entry */
S        return FR_OK;
S    }
S#endif
S    while (di) {                        /* Strip trailing spaces and dots */
S        w = lfn[di-1];
S        if (w != ' ' && w != '.') break;
S        di--;
S    }
S    if (!di) return FR_INVALID_NAME;    /* Reject nul string */
S
S    lfn[di] = 0;                        /* LFN is created */
S
S    /* Create SFN in directory form */
S    mem_set(dj->fn, ' ', 11);
S    for (si = 0; lfn[si] == ' ' || lfn[si] == '.'; si++) ;  /* Strip leading spaces and dots */
S    if (si) cf |= NS_LOSS | NS_LFN;
S    while (di && lfn[di - 1] != '.') di--;  /* Find extension (di<=si: no extension) */
S
S    b = i = 0; ni = 8;
S    for (;;) {
S        w = lfn[si++];                  /* Get an LFN char */
S        if (!w) break;                  /* Break on end of the LFN */
S        if (w == ' ' || (w == '.' && si != di)) {   /* Remove spaces and dots */
S            cf |= NS_LOSS | NS_LFN; continue;
S        }
S
S        if (i >= ni || si == di) {      /* Extension or end of SFN */
S            if (ni == 11) {             /* Long extension */
S                cf |= NS_LOSS | NS_LFN; break;
S            }
S            if (si != di) cf |= NS_LOSS | NS_LFN;   /* Out of 8.3 format */
S            if (si > di) break;         /* No extension */
S            si = di; i = 8; ni = 11;    /* Enter extension section */
S            b <<= 2; continue;
S        }
S
S        if (w >= 0x80) {                /* Non ASCII char */
S#ifdef _EXCVT
S            w = ff_convert(w, 0);       /* Unicode -> OEM code */
S            if (w) w = ExCvt[w - 0x80]; /* Convert extended char to upper (SBCS) */
S#else
S            w = ff_convert(ff_wtoupper(w), 0);  /* Upper converted Unicode -> OEM code */
S#endif
S            cf |= NS_LFN;               /* Force create LFN entry */
S        }
S
S        if (_DF1S && w >= 0x100) {      /* Double byte char (always false on SBCS cfg) */
S            if (i >= ni - 1) {
S                cf |= NS_LOSS | NS_LFN; i = ni; continue;
S            }
S            dj->fn[i++] = (BYTE)(w >> 8);
S        } else {                        /* Single byte char */
S            if (!w || chk_chr("+,;=[]", w)) {   /* Replace illegal chars for SFN */
S                w = '_'; cf |= NS_LOSS | NS_LFN;/* Lossy conversion */
S            } else {
S                if (IsUpper(w)) {       /* ASCII large capital */
S                    b |= 2;
S                } else {
S                    if (IsLower(w)) {   /* ASCII small capital */
S                        b |= 1; w -= 0x20;
S                    }
S                }
S            }
S        }
S        dj->fn[i++] = (BYTE)w;
S    }
S
S    if (dj->fn[0] == DDE) dj->fn[0] = NDDE; /* If the first char collides with deleted mark, replace it with 0x05 */
S
S    if (ni == 8) b <<= 2;
S    if ((b & 0x0C) == 0x0C || (b & 0x03) == 0x03)   /* Create LFN entry when there are composite capitals */
S        cf |= NS_LFN;
S    if (!(cf & NS_LFN)) {                       /* When LFN is in 8.3 format without extended char, NT flags are created */
S        if ((b & 0x03) == 0x01) cf |= NS_EXT;   /* NT flag (Extension has only small capital) */
S        if ((b & 0x0C) == 0x04) cf |= NS_BODY;  /* NT flag (Filename has only small capital) */
S    }
S
S    dj->fn[NS] = cf;    /* SFN is created */
S
S    return FR_OK;
S
S
N#else   /* Non-LFN configuration */
N    BYTE b, c, d, *sfn;
N    UINT ni, si, i;
N    const char *p;
N
N    /* Create file name in directory form */
N    for (p = *path; *p == '/' || *p == '\\'; p++) ; /* Strip duplicated separator */
N    sfn = dj->fn;
N    mem_set(sfn, ' ', 11);
N    si = i = b = 0; ni = 8;
N#if _FS_RPATH
X#if 0
S    if (p[si] == '.') { /* Is this a dot entry? */
S        for (;;) {
S            c = (BYTE)p[si++];
S            if (c != '.' || si >= 3) break;
S            sfn[i++] = c;
S        }
S        if (c != '/' && c != '\\' && c > ' ') return FR_INVALID_NAME;
S        *path = &p[si];                                 /* Return pointer to the next segment */
S        sfn[NS] = (c <= ' ') ? NS_LAST | NS_DOT : NS_DOT;   /* Set last segment flag if end of path */
S        return FR_OK;
S    }
N#endif
N    for (;;) {
N        c = (BYTE)p[si++];
N        if (c <= ' ' || c == '/' || c == '\\') break;   /* Break on end of segment */
N        if (c == '.' || i >= ni) {
N            if (ni != 8 || c != '.') return FR_INVALID_NAME;
N            i = 8; ni = 11;
N            b <<= 2; continue;
N        }
N        if (c >= 0x80) {                /* Extended char? */
N            b |= 3;                     /* Eliminate NT flag */
N#ifdef _EXCVT
S            c = ExCvt[c - 0x80];        /* To upper extended chars (SBCS cfg) */
N#else
N#if !_DF1S
X#if !0x81
S            return FR_INVALID_NAME;     /* Reject extended chars (ASCII cfg) */
N#endif
N#endif
N        }
N        if (IsDBCS1(c)) {               /* Check if it is a DBC 1st byte (always false on SBCS cfg) */
X        if ((((BYTE)(c) >= 0x81 && (BYTE)(c) <= 0x9F) || ((BYTE)(c) >= 0xE0 && (BYTE)(c) <= 0xFC))) {                
N            d = (BYTE)p[si++];          /* Get 2nd byte */
N            if (!IsDBCS2(d) || i >= ni - 1) /* Reject invalid DBC */
X            if (!(((BYTE)(d) >= 0x40 && (BYTE)(d) <= 0x7E) || ((BYTE)(d) >= 0x80 && (BYTE)(d) <= 0xFC)) || i >= ni - 1)  
N                return FR_INVALID_NAME;
N            sfn[i++] = c;
N            sfn[i++] = d;
N        } else {                        /* Single byte code */
N            if (chk_chr("\"*+,:;<=>\?[]|\x7F", c))  /* Reject illegal chrs for SFN */
N                return FR_INVALID_NAME;
N            if (IsUpper(c)) {           /* ASCII large capital? */
X            if ((((c)>= 'A')&&((c)<= 'Z'))) {            
N                b |= 2;
N            } else {
N                if (IsLower(c)) {       /* ASCII small capital? */
X                if ((((c)>= 'a')&&((c)<= 'z'))) {        
N                    b |= 1; c -= 0x20;
N                }
N            }
N            sfn[i++] = c;
N        }
N    }
N    *path = &p[si];                     /* Return pointer to the next segment */
N    c = (c <= ' ') ? NS_LAST : 0;       /* Set last segment flag if end of path */
X    c = (c <= ' ') ? 0x04 : 0;        
N
N    if (!i) return FR_INVALID_NAME;     /* Reject nul string */
N    if (sfn[0] == DDE) sfn[0] = NDDE;   /* When first char collides with DDE, replace it with 0x05 */
X    if (sfn[0] == 0xE5) sfn[0] = 0x05;    
N
N    if (ni == 8) b <<= 2;
N    if ((b & 0x03) == 0x01) c |= NS_EXT;    /* NT flag (Name extension has only small capital) */
X    if ((b & 0x03) == 0x01) c |= 0x10;     
N    if ((b & 0x0C) == 0x04) c |= NS_BODY;   /* NT flag (Name body has only small capital) */
X    if ((b & 0x0C) == 0x04) c |= 0x08;    
N
N    sfn[NS] = c;        /* Store NT flag, File name is created */
X    sfn[11] = c;         
N
N    return FR_OK;
N#endif
R "../ff.c" 1819 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
R "../ff.c" 1842 15 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1845 15 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1864 19 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1867 23 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1867 31 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1874 7 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1879 20 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1880 31 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1881 31 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Get file information from directory entry                             */
N/*-----------------------------------------------------------------------*/
N#if _FS_MINIMIZE <= 1 || _FS_RPATH >= 2
X#if 0 <= 1 || 0 >= 2
Nstatic
Nvoid get_fileinfo (     /* No return code */
N    DIR *dj,            /* Pointer to the directory object */
N    FILINFO *fno        /* Pointer to the file information to be filled */
N)
N{
N    UINT i;
N    BYTE nt, *dir;
N    TCHAR *p, c;
N
N
N    p = fno->fname;
N    if (dj->sect) {
N        dir = dj->dir;
N        nt = dir[DIR_NTres];        /* NT flag */
X        nt = dir[12];         
N        for (i = 0; i < 8; i++) {   /* Copy name body */
N            c = dir[i];
N            if (c == ' ') break;
N            if (c == NDDE) c = (TCHAR)DDE;
X            if (c == 0x05) c = (TCHAR)0xE5;
N            if (_USE_LFN && (nt & NS_BODY) && IsUpper(c)) c += 0x20;
X            if (0 && (nt & 0x08) && (((c)>= 'A')&&((c)<= 'Z'))) c += 0x20;
N#if _LFN_UNICODE
X#if 0
S            if (IsDBCS1(c) && i < 7 && IsDBCS2(dir[i+1]))
S                c = (c << 8) | dir[++i];
S            c = ff_convert(c, 1);
S            if (!c) c = '?';
N#endif
N            *p++ = c;
N        }
N        if (dir[8] != ' ') {        /* Copy name extension */
N            *p++ = '.';
N            for (i = 8; i < 11; i++) {
N                c = dir[i];
N                if (c == ' ') break;
N                if (_USE_LFN && (nt & NS_EXT) && IsUpper(c)) c += 0x20;
X                if (0 && (nt & 0x10) && (((c)>= 'A')&&((c)<= 'Z'))) c += 0x20;
N#if _LFN_UNICODE
X#if 0
S                if (IsDBCS1(c) && i < 10 && IsDBCS2(dir[i+1]))
S                    c = (c << 8) | dir[++i];
S                c = ff_convert(c, 1);
S                if (!c) c = '?';
N#endif
N                *p++ = c;
N            }
N        }
N        fno->fattrib = dir[DIR_Attr];               /* Attribute */
X        fno->fattrib = dir[11];                
N        fno->fsize = LD_DWORD(dir+DIR_FileSize);    /* Size */
X        fno->fsize = (DWORD)(((DWORD)*((BYTE*)(dir+28)+3)<<24)|((DWORD)*((BYTE*)(dir+28)+2)<<16)|((WORD)*((BYTE*)(dir+28)+1)<<8)| *(BYTE*)(dir+28));     
N        fno->fdate = LD_WORD(dir+DIR_WrtDate);      /* Date */
X        fno->fdate = (WORD)(((WORD)*((BYTE*)(dir+24)+1)<<8)|(WORD)*(BYTE*)(dir+24));       
N        fno->ftime = LD_WORD(dir+DIR_WrtTime);      /* Time */
X        fno->ftime = (WORD)(((WORD)*((BYTE*)(dir+22)+1)<<8)|(WORD)*(BYTE*)(dir+22));       
N    }
N    *p = 0;     /* Terminate SFN str by a \0 */
N
N#if _USE_LFN
X#if 0
S    if (fno->lfname && fno->lfsize) {
S        TCHAR *tp = fno->lfname;
S        WCHAR w, *lfn;
S
S        i = 0;
S        if (dj->sect && dj->lfn_idx != 0xFFFF) {/* Get LFN if available */
S            lfn = dj->lfn;
S            while ((w = *lfn++) != 0) {         /* Get an LFN char */
S#if !_LFN_UNICODE
S                w = ff_convert(w, 0);           /* Unicode -> OEM conversion */
S                if (!w) { i = 0; break; }       /* Could not convert, no LFN */
S                if (_DF1S && w >= 0x100)        /* Put 1st byte if it is a DBC (always false on SBCS cfg) */
S                    tp[i++] = (TCHAR)(w >> 8);
S#endif
S                if (i >= fno->lfsize - 1) { i = 0; break; } /* Buffer overflow, no LFN */
S                tp[i++] = (TCHAR)w;
S            }
S        }
S        tp[i] = 0;  /* Terminate the LFN str by a \0 */
S    }
N#endif
R "../ff.c" 1915 61 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 1929 64 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N#endif /* _FS_MINIMIZE <= 1 || _FS_RPATH >= 2*/
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Follow a file path                                                    */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NFRESULT follow_path (   /* FR_OK(0): successful, !=0: error code */
N    DIR *dj,            /* Directory object to return last directory and found object */
N    const TCHAR *path   /* Full-path string to find a file or directory */
N)
N{
N    FRESULT res;
N    BYTE *dir, ns;
N
N
N#if _FS_RPATH
X#if 0
S    if (*path == '/' || *path == '\\') { /* There is a heading separator */
S        path++; dj->sclust = 0;     /* Strip it and start from the root dir */
S    } else {                            /* No heading separator */
S        dj->sclust = dj->fs->cdir;  /* Start from the current dir */
S    }
N#else
N    if (*path == '/' || *path == '\\')  /* Strip heading separator if exist */
N        path++;
N    dj->sclust = 0;                     /* Start from the root dir */
N#endif
N
N    if ((UINT)*path < ' ') {            /* Nul path means the start directory itself */
N        res = dir_sdi(dj, 0);
N        dj->dir = 0;
N    } else {                            /* Follow path */
N        for (;;) {
N            res = create_name(dj, &path);   /* Get a segment */
N            if (res != FR_OK) break;
N            res = dir_find(dj);             /* Find it */
N            ns = *(dj->fn+NS);
X            ns = *(dj->fn+11);
N            if (res != FR_OK) {             /* Failed to find the object */
N                if (res != FR_NO_FILE) break;   /* Abort if any hard error occurred */
N                /* Object not found */
N                if (_FS_RPATH && (ns & NS_DOT)) {   /* If dot entry is not exit */
X                if (0 && (ns & 0x20)) {    
N                    dj->sclust = 0; dj->dir = 0;    /* It is the root dir */
N                    res = FR_OK;
N                    if (!(ns & NS_LAST)) continue;
X                    if (!(ns & 0x04)) continue;
N                } else {                            /* Could not find the object */
N                    if (!(ns & NS_LAST)) res = FR_NO_PATH;
X                    if (!(ns & 0x04)) res = FR_NO_PATH;
N                }
N                break;
N            }
N            if (ns & NS_LAST) break;            /* Last segment match. Function completed. */
X            if (ns & 0x04) break;             
N            dir = dj->dir;                      /* There is next segment. Follow the sub directory */
N            if (!(dir[DIR_Attr] & AM_DIR)) {    /* Cannot follow because it is a file */
X            if (!(dir[11] & 0x10)) {     
N                res = FR_NO_PATH; break;
N            }
N            dj->sclust = ld_clust(dj->fs, dir);
N        }
N    }
N
N    return res;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Load a sector and check if it is an FAT Volume Boot Record            */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NBYTE check_fs ( /* 0:FAT-VBR, 1:Any BR but not FAT, 2:Not a BR, 3:Disk error */
N    FATFS *fs,  /* File system object */
N    DWORD sect  /* Sector# (lba) to check if it is an FAT boot record or not */
N)
N{
N    if (disk_read(fs->drv, fs->win, sect, 1) != RES_OK) /* Load boot record */
N        return 3;
N    if (LD_WORD(&fs->win[BS_55AA]) != 0xAA55)       /* Check record signature (always placed at offset 510 even if the sector size is >512) */
X    if ((WORD)(((WORD)*((BYTE*)(&fs->win[510])+1)<<8)|(WORD)*(BYTE*)(&fs->win[510])) != 0xAA55)        
N        return 2;
N
N    if ((LD_DWORD(&fs->win[BS_FilSysType]) & 0xFFFFFF) == 0x544146) /* Check "FAT" string */
X    if (((DWORD)(((DWORD)*((BYTE*)(&fs->win[54])+3)<<24)|((DWORD)*((BYTE*)(&fs->win[54])+2)<<16)|((WORD)*((BYTE*)(&fs->win[54])+1)<<8)| *(BYTE*)(&fs->win[54])) & 0xFFFFFF) == 0x544146)  
N        return 0;
N    if ((LD_DWORD(&fs->win[BS_FilSysType32]) & 0xFFFFFF) == 0x544146)
X    if (((DWORD)(((DWORD)*((BYTE*)(&fs->win[82])+3)<<24)|((DWORD)*((BYTE*)(&fs->win[82])+2)<<16)|((WORD)*((BYTE*)(&fs->win[82])+1)<<8)| *(BYTE*)(&fs->win[82])) & 0xFFFFFF) == 0x544146)
N        return 0;
N
N    return 1;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Check if the file system object is valid or not                       */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NFRESULT chk_mounted (   /* FR_OK(0): successful, !=0: any error occurred */
N    const TCHAR **path, /* Pointer to pointer to the path name (drive number) */
N    FATFS **rfs,        /* Pointer to pointer to the found file system object */
N    BYTE wmode          /* !=0: Check write protection for write access */
N)
N{
N    BYTE fmt, b, pi, *tbl;
N    UINT vol;
N    DSTATUS stat;
N    DWORD bsect, fasize, tsect, sysect, nclst, szbfat;
N    WORD nrsv;
N    const TCHAR *p = *path;
N    FATFS *fs;
N
N
N    /* Get logical drive number from the path name */
N    vol = p[0] - '0';                   /* Is there a drive number? */
N    if (vol <= 9 && p[1] == ':') {      /* Found a drive number, get and strip it */
N        p += 2; *path = p;              /* Return pointer to the path name */
N    } else {                            /* No drive number, use default drive */
N#if _FS_RPATH
X#if 0
S        vol = CurrVol;                  /* Use current drive */
N#else
N        vol = 0;                        /* Use drive 0 */
N#endif
N    }
N
N    /* Check if the file system object is valid or not */
N    *rfs = 0;
N    if (vol >= _VOLUMES)                /* Is the drive number valid? */
X    if (vol >= 1)                 
N        return FR_INVALID_DRIVE;
N    fs = FatFs[vol];                    /* Get corresponding file system object */
N    if (!fs) return FR_NOT_ENABLED;     /* Is the file system object available? */
N
N    ENTER_FF(fs);                       /* Lock volume */
X    ;                        
N
N    *rfs = fs;                          /* Return pointer to the corresponding file system object */
N    if (fs->fs_type) {                  /* If the volume has been mounted */
N        stat = disk_status(fs->drv);
N        if (!(stat & STA_NOINIT)) {     /* and the physical drive is kept initialized (has not been changed), */
X        if (!(stat & 0x01)) {      
N            if (!_FS_READONLY && wmode && (stat & STA_PROTECT)) /* Check write protection if needed */
X            if (!0 && wmode && (stat & 0x04))  
N                return FR_WRITE_PROTECTED;
N            return FR_OK;               /* The file system object is valid */
N        }
N    }
N
N    /* The file system object is not valid. */
N    /* Following code attempts to mount the volume. (analyze BPB and initialize the fs object) */
N
N    fs->fs_type = 0;                    /* Clear the file system object */
N    fs->drv = LD2PD(vol);               /* Bind the logical drive and a physical drive */
X    fs->drv = (BYTE)(vol);                
N    stat = disk_initialize(fs->drv);    /* Initialize the physical drive */
N    if (stat & STA_NOINIT)              /* Check if the initialization succeeded */
X    if (stat & 0x01)               
N        return FR_NOT_READY;            /* Failed to initialize due to no medium or hard error */
N    if (!_FS_READONLY && wmode && (stat & STA_PROTECT)) /* Check disk write protection if needed */
X    if (!0 && wmode && (stat & 0x04))  
N        return FR_WRITE_PROTECTED;
N#if _MAX_SS != 512                      /* Get disk sector size (variable sector size cfg only) */
X#if 512 != 512                       
S    if (disk_ioctl(fs->drv, GET_SECTOR_SIZE, &fs->ssize) != RES_OK)
S        return FR_DISK_ERR;
N#endif
N    /* Search FAT partition on the drive. Supports only generic partitions, FDISK and SFD. */
N    fmt = check_fs(fs, bsect = 0);      /* Load sector 0 and check if it is an FAT-VBR (in SFD) */
N    if (LD2PT(vol) && !fmt) fmt = 1;    /* Force non-SFD if the volume is forced partition */
X    if (0 && !fmt) fmt = 1;     
N    if (fmt == 1) {                     /* Not an FAT-VBR, the physical drive can be partitioned */
N        /* Check the partition listed in the partition table */
N        pi = LD2PT(vol);
X        pi = 0;
N        if (pi) pi--;
N        tbl = &fs->win[MBR_Table + pi * SZ_PTE];/* Partition table */
X        tbl = &fs->win[446 + pi * 16]; 
N        if (tbl[4]) {                       /* Is the partition existing? */
N            bsect = LD_DWORD(&tbl[8]);      /* Partition offset in LBA */
X            bsect = (DWORD)(((DWORD)*((BYTE*)(&tbl[8])+3)<<24)|((DWORD)*((BYTE*)(&tbl[8])+2)<<16)|((WORD)*((BYTE*)(&tbl[8])+1)<<8)| *(BYTE*)(&tbl[8]));       
N            fmt = check_fs(fs, bsect);      /* Check the partition */
N        }
N    }
N    if (fmt == 3) return FR_DISK_ERR;
N    if (fmt) return FR_NO_FILESYSTEM;       /* No FAT volume is found */
N
N    /* An FAT volume is found. Following code initializes the file system object */
N
N    if (LD_WORD(fs->win+BPB_BytsPerSec) != SS(fs))      /* (BPB_BytsPerSec must be equal to the physical sector size) */
X    if ((WORD)(((WORD)*((BYTE*)(fs->win+11)+1)<<8)|(WORD)*(BYTE*)(fs->win+11)) != 512U)       
N        return FR_NO_FILESYSTEM;
N
N    fasize = LD_WORD(fs->win+BPB_FATSz16);              /* Number of sectors per FAT */
X    fasize = (WORD)(((WORD)*((BYTE*)(fs->win+22)+1)<<8)|(WORD)*(BYTE*)(fs->win+22));               
N    if (!fasize) fasize = LD_DWORD(fs->win+BPB_FATSz32);
X    if (!fasize) fasize = (DWORD)(((DWORD)*((BYTE*)(fs->win+36)+3)<<24)|((DWORD)*((BYTE*)(fs->win+36)+2)<<16)|((WORD)*((BYTE*)(fs->win+36)+1)<<8)| *(BYTE*)(fs->win+36));
N    fs->fsize = fasize;
N
N    fs->n_fats = b = fs->win[BPB_NumFATs];              /* Number of FAT copies */
X    fs->n_fats = b = fs->win[16];               
N    if (b != 1 && b != 2) return FR_NO_FILESYSTEM;      /* (Must be 1 or 2) */
N    fasize *= b;                                        /* Number of sectors for FAT area */
N
N    fs->csize = b = fs->win[BPB_SecPerClus];            /* Number of sectors per cluster */
X    fs->csize = b = fs->win[13];             
N    if (!b || (b & (b - 1))) return FR_NO_FILESYSTEM;   /* (Must be power of 2) */
N
N    fs->n_rootdir = LD_WORD(fs->win+BPB_RootEntCnt);    /* Number of root directory entries */
X    fs->n_rootdir = (WORD)(((WORD)*((BYTE*)(fs->win+17)+1)<<8)|(WORD)*(BYTE*)(fs->win+17));     
N    if (fs->n_rootdir % (SS(fs) / SZ_DIR)) return FR_NO_FILESYSTEM; /* (BPB_RootEntCnt must be sector aligned) */
X    if (fs->n_rootdir % (512U / 32)) return FR_NO_FILESYSTEM;  
N
N    tsect = LD_WORD(fs->win+BPB_TotSec16);              /* Number of sectors on the volume */
X    tsect = (WORD)(((WORD)*((BYTE*)(fs->win+19)+1)<<8)|(WORD)*(BYTE*)(fs->win+19));               
N    if (!tsect) tsect = LD_DWORD(fs->win+BPB_TotSec32);
X    if (!tsect) tsect = (DWORD)(((DWORD)*((BYTE*)(fs->win+32)+3)<<24)|((DWORD)*((BYTE*)(fs->win+32)+2)<<16)|((WORD)*((BYTE*)(fs->win+32)+1)<<8)| *(BYTE*)(fs->win+32));
N
N    nrsv = LD_WORD(fs->win+BPB_RsvdSecCnt);             /* Number of reserved sectors */
X    nrsv = (WORD)(((WORD)*((BYTE*)(fs->win+14)+1)<<8)|(WORD)*(BYTE*)(fs->win+14));              
N    if (!nrsv) return FR_NO_FILESYSTEM;                 /* (BPB_RsvdSecCnt must not be 0) */
N
N    /* Determine the FAT sub type */
N    sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZ_DIR); /* RSV+FAT+DIR */
X    sysect = nrsv + fasize + fs->n_rootdir / (512U / 32);  
N    if (tsect < sysect) return FR_NO_FILESYSTEM;        /* (Invalid volume size) */
N    nclst = (tsect - sysect) / fs->csize;               /* Number of clusters */
N    if (!nclst) return FR_NO_FILESYSTEM;                /* (Invalid volume size) */
N    fmt = FS_FAT12;
X    fmt = 1;
N    if (nclst >= MIN_FAT16) fmt = FS_FAT16;
X    if (nclst >= 4086) fmt = 2;
N    if (nclst >= MIN_FAT32) fmt = FS_FAT32;
X    if (nclst >= 65526) fmt = 3;
N
N    /* Boundaries and Limits */
N    fs->n_fatent = nclst + 2;                           /* Number of FAT entries */
N    fs->volbase = bsect;                                /* Volume start sector */
N    fs->fatbase = bsect + nrsv;                         /* FAT start sector */
N    fs->database = bsect + sysect;                      /* Data start sector */
N    if (fmt == FS_FAT32) {
X    if (fmt == 3) {
N        if (fs->n_rootdir) return FR_NO_FILESYSTEM;     /* (BPB_RootEntCnt must be 0) */
N        fs->dirbase = LD_DWORD(fs->win+BPB_RootClus);   /* Root directory start cluster */
X        fs->dirbase = (DWORD)(((DWORD)*((BYTE*)(fs->win+44)+3)<<24)|((DWORD)*((BYTE*)(fs->win+44)+2)<<16)|((WORD)*((BYTE*)(fs->win+44)+1)<<8)| *(BYTE*)(fs->win+44));    
N        szbfat = fs->n_fatent * 4;                      /* (Required FAT size) */
N    } else {
N        if (!fs->n_rootdir) return FR_NO_FILESYSTEM;    /* (BPB_RootEntCnt must not be 0) */
N        fs->dirbase = fs->fatbase + fasize;             /* Root directory start sector */
N        szbfat = (fmt == FS_FAT16) ?                    /* (Required FAT size) */
X        szbfat = (fmt == 2) ?                     
N            fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
N    }
N    if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs))   /* (BPB_FATSz must not be less than required) */
X    if (fs->fsize < (szbfat + (512U - 1)) / 512U)    
N        return FR_NO_FILESYSTEM;
N
N#if !_FS_READONLY
X#if !0
N    /* Initialize cluster allocation information */
N    fs->free_clust = 0xFFFFFFFF;
N    fs->last_clust = 0;
N
N    /* Get fsinfo if available */
N    if (fmt == FS_FAT32) {
X    if (fmt == 3) {
N        fs->fsi_flag = 0;
N        fs->fsi_sector = bsect + LD_WORD(fs->win+BPB_FSInfo);
X        fs->fsi_sector = bsect + (WORD)(((WORD)*((BYTE*)(fs->win+48)+1)<<8)|(WORD)*(BYTE*)(fs->win+48));
N        if (disk_read(fs->drv, fs->win, fs->fsi_sector, 1) == RES_OK &&
N            LD_WORD(fs->win+BS_55AA) == 0xAA55 &&
X            (WORD)(((WORD)*((BYTE*)(fs->win+510)+1)<<8)|(WORD)*(BYTE*)(fs->win+510)) == 0xAA55 &&
N            LD_DWORD(fs->win+FSI_LeadSig) == 0x41615252 &&
X            (DWORD)(((DWORD)*((BYTE*)(fs->win+0)+3)<<24)|((DWORD)*((BYTE*)(fs->win+0)+2)<<16)|((WORD)*((BYTE*)(fs->win+0)+1)<<8)| *(BYTE*)(fs->win+0)) == 0x41615252 &&
N            LD_DWORD(fs->win+FSI_StrucSig) == 0x61417272) {
X            (DWORD)(((DWORD)*((BYTE*)(fs->win+484)+3)<<24)|((DWORD)*((BYTE*)(fs->win+484)+2)<<16)|((WORD)*((BYTE*)(fs->win+484)+1)<<8)| *(BYTE*)(fs->win+484)) == 0x61417272) {
N                fs->last_clust = LD_DWORD(fs->win+FSI_Nxt_Free);
X                fs->last_clust = (DWORD)(((DWORD)*((BYTE*)(fs->win+492)+3)<<24)|((DWORD)*((BYTE*)(fs->win+492)+2)<<16)|((WORD)*((BYTE*)(fs->win+492)+1)<<8)| *(BYTE*)(fs->win+492));
N                fs->free_clust = LD_DWORD(fs->win+FSI_Free_Count);
X                fs->free_clust = (DWORD)(((DWORD)*((BYTE*)(fs->win+488)+3)<<24)|((DWORD)*((BYTE*)(fs->win+488)+2)<<16)|((WORD)*((BYTE*)(fs->win+488)+1)<<8)| *(BYTE*)(fs->win+488));
N        }
N    }
N#endif
N    fs->fs_type = fmt;      /* FAT sub-type */
N    fs->id = ++Fsid;        /* File system mount ID */
N    fs->winsect = 0;        /* Invalidate sector cache */
N    fs->wflag = 0;
N#if _FS_RPATH
X#if 0
S    fs->cdir = 0;           /* Current directory (root dir) */
N#endif
N#if _FS_LOCK                /* Clear file lock semaphores */
X#if 0                 
S    clear_lock(fs);
N#endif
N
N    return FR_OK;
R "../ff.c" 2133 19 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 2165 10 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Check if the file/dir object is valid or not                          */
N/*-----------------------------------------------------------------------*/
N
Nstatic
NFRESULT validate (  /* FR_OK(0): The object is valid, !=0: Invalid */
N    void* obj       /* Pointer to the object FIL/DIR to check validity */
N)
N{
N    FIL *fil = (FIL*)obj;   /* Assuming offset of fs and id in the FIL/DIR is identical */
N
N
N    if (!fil || !fil->fs || !fil->fs->fs_type || fil->fs->id != fil->id)
N        return FR_INVALID_OBJECT;
N
N    ENTER_FF(fil->fs);      /* Lock file system */
X    ;       
N
N    if (disk_status(fil->fs->drv) & STA_NOINIT)
X    if (disk_status(fil->fs->drv) & 0x01)
N        return FR_NOT_READY;
N
N    return FR_OK;
N}
N
N
N
N
N/*--------------------------------------------------------------------------
N
N   Public Functions
N
N--------------------------------------------------------------------------*/
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Mount/Unmount a Logical Drive                                         */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_mount (
N    BYTE vol,       /* Logical drive number to be mounted/unmounted */
N    FATFS *fs       /* Pointer to new file system object (NULL for unmount)*/
N)
N{
N    FATFS *rfs;
N
N
N    if (vol >= _VOLUMES)        /* Check if the drive number is valid */
X    if (vol >= 1)         
N        return FR_INVALID_DRIVE;
N    rfs = FatFs[vol];           /* Get current fs object */
N
N    if (rfs) {
N#if _FS_LOCK
X#if 0
S        clear_lock(rfs);
N#endif
N#if _FS_REENTRANT               /* Discard sync object of the current volume */
X#if 0                
S        if (!ff_del_syncobj(rfs->sobj)) return FR_INT_ERR;
N#endif
N        rfs->fs_type = 0;       /* Clear old fs object */
N    }
N
N    if (fs) {
N        fs->fs_type = 0;        /* Clear new fs object */
N#if _FS_REENTRANT               /* Create sync object for the new volume */
X#if 0                
S        if (!ff_cre_syncobj(vol, &fs->sobj)) return FR_INT_ERR;
N#endif
N    }
N    FatFs[vol] = fs;            /* Register new fs object */
N
N    return FR_OK;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Open or Create a File                                                 */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_open (
N    FIL *fp,            /* Pointer to the blank file object */
N    const TCHAR *path,  /* Pointer to the file name */
N    BYTE mode           /* Access mode and file open mode flags */
N)
N{
N    FRESULT res;
N    DIR dj;
N    BYTE *dir;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    if (!fp) return FR_INVALID_OBJECT;
N    fp->fs = 0;         /* Clear file object */
N
N#if !_FS_READONLY
X#if !0
N    mode &= FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW;
X    mode &= 0x01 | 0x02 | 0x08 | 0x10 | 0x04;
N    res = chk_mounted(&path, &dj.fs, (BYTE)(mode & ~FA_READ));
X    res = chk_mounted(&path, &dj.fs, (BYTE)(mode & ~0x01));
N#else
S    mode &= FA_READ;
S    res = chk_mounted(&path, &dj.fs, 0);
N#endif
N    if (res == FR_OK) {
N        INIT_BUF(dj);
X        (dj). fn = sfn;
N        res = follow_path(&dj, path);   /* Follow the file path */
N        dir = dj.dir;
N#if !_FS_READONLY   /* R/W configuration */
X#if !0    
N        if (res == FR_OK) {
N            if (!dir)   /* Current dir itself */
N                res = FR_INVALID_NAME;
N#if _FS_LOCK
X#if 0
S            else
S                res = chk_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
N#endif
N        }
N        /* Create or Open a file */
N        if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW)) {
X        if (mode & (0x08 | 0x10 | 0x04)) {
N            DWORD dw, cl;
N
N            if (res != FR_OK) {                 /* No file, create new */
N                if (res == FR_NO_FILE)          /* There is no file to open, create a new entry */
N#if _FS_LOCK
X#if 0
S                    res = enq_lock() ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;
N#else
N                    res = dir_register(&dj);
N#endif
N                mode |= FA_CREATE_ALWAYS;       /* File is created */
X                mode |= 0x08;        
N                dir = dj.dir;                   /* New entry */
N            }
N            else {                              /* Any object is already existing */
N                if (dir[DIR_Attr] & (AM_RDO | AM_DIR)) {    /* Cannot overwrite it (R/O or DIR) */
X                if (dir[11] & (0x01 | 0x10)) {     
N                    res = FR_DENIED;
N                } else {
N                    if (mode & FA_CREATE_NEW)   /* Cannot create as new file */
X                    if (mode & 0x04)    
N                        res = FR_EXIST;
N                }
N            }
N            if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {    /* Truncate it if overwrite mode */
X            if (res == FR_OK && (mode & 0x08)) {     
N                dw = get_fattime();                 /* Created time */
N                ST_DWORD(dir+DIR_CrtTime, dw);
X                *(BYTE*)(dir+14)=(BYTE)(dw); *((BYTE*)(dir+14)+1)=(BYTE)((WORD)(dw)>>8); *((BYTE*)(dir+14)+2)=(BYTE)((DWORD)(dw)>>16); *((BYTE*)(dir+14)+3)=(BYTE)((DWORD)(dw)>>24);
N                dir[DIR_Attr] = 0;                  /* Reset attribute */
X                dir[11] = 0;                   
N                ST_DWORD(dir+DIR_FileSize, 0);      /* size = 0 */
X                *(BYTE*)(dir+28)=(BYTE)(0); *((BYTE*)(dir+28)+1)=(BYTE)((WORD)(0)>>8); *((BYTE*)(dir+28)+2)=(BYTE)((DWORD)(0)>>16); *((BYTE*)(dir+28)+3)=(BYTE)((DWORD)(0)>>24);       
N                cl = ld_clust(dj.fs, dir);          /* Get start cluster */
N                st_clust(dir, 0);                   /* cluster = 0 */
N                dj.fs->wflag = 1;
N                if (cl) {                           /* Remove the cluster chain if exist */
N                    dw = dj.fs->winsect;
N                    res = remove_chain(dj.fs, cl);
N                    if (res == FR_OK) {
N                        dj.fs->last_clust = cl - 1; /* Reuse the cluster hole */
N                        res = move_window(dj.fs, dw);
N                    }
N                }
N            }
N        }
N        else {  /* Open an existing file */
N            if (res == FR_OK) {                     /* Follow succeeded */
N                if (dir[DIR_Attr] & AM_DIR) {       /* It is a directory */
X                if (dir[11] & 0x10) {        
N                    res = FR_NO_FILE;
N                } else {
N                    if ((mode & FA_WRITE) && (dir[DIR_Attr] & AM_RDO)) /* R/O violation */
X                    if ((mode & 0x02) && (dir[11] & 0x01))  
N                        res = FR_DENIED;
N                }
N            }
N        }
N        if (res == FR_OK) {
N            if (mode & FA_CREATE_ALWAYS)            /* Set file change flag if created or overwritten */
X            if (mode & 0x08)             
N                mode |= FA__WRITTEN;
X                mode |= 0x20;
N            fp->dir_sect = dj.fs->winsect;          /* Pointer to the directory entry */
N            fp->dir_ptr = dir;
N#if _FS_LOCK
X#if 0
S            fp->lockid = inc_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
S            if (!fp->lockid) res = FR_INT_ERR;
N#endif
N        }
N
N#else               /* R/O configuration */
S        if (res == FR_OK) {                 /* Follow succeeded */
S            dir = dj.dir;
S            if (!dir) {                     /* Current dir itself */
S                res = FR_INVALID_NAME;
S            } else {
S                if (dir[DIR_Attr] & AM_DIR) /* It is a directory */
S                    res = FR_NO_FILE;
S            }
S        }
N#endif
N        FREE_BUF();
X        ;
N
N        if (res == FR_OK) {
N            fp->flag = mode;                    /* File access mode */
N            fp->sclust = ld_clust(dj.fs, dir);  /* File start cluster */
N            fp->fsize = LD_DWORD(dir+DIR_FileSize); /* File size */
X            fp->fsize = (DWORD)(((DWORD)*((BYTE*)(dir+28)+3)<<24)|((DWORD)*((BYTE*)(dir+28)+2)<<16)|((WORD)*((BYTE*)(dir+28)+1)<<8)| *(BYTE*)(dir+28));  
N            fp->fptr = 0;                       /* File pointer */
N            fp->dsect = 0;
N#if _USE_FASTSEEK
X#if 0
S            fp->cltbl = 0;                      /* Normal seek mode */
N#endif
N            fp->fs = dj.fs; fp->id = dj.fs->id; /* Validate file object */
N        }
N    }
N
N    LEAVE_FF(dj.fs, res);
X    return res;
R "../ff.c" 2324 10 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 2354 22 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 2395 22 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 2354 22 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Read File                                                             */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_read (
N    FIL *fp,        /* Pointer to the file object */
N    void *buff,     /* Pointer to data buffer */
N    UINT btr,       /* Number of bytes to read */
N    UINT *br        /* Pointer to number of bytes read */
N)
N{
N    FRESULT res;
N    DWORD clst, sect, remain;
N    UINT rcnt, cc;
N    BYTE csect, *rbuff = (BYTE*)buff;
N
N
N    *br = 0;    /* Clear read byte counter */
N
N    res = validate(fp);                         /* Check validity */
N    if (res != FR_OK) LEAVE_FF(fp->fs, res);
X    if (res != FR_OK) return res;
N    if (fp->flag & FA__ERROR)                   /* Aborted file? */
X    if (fp->flag & 0x80)                    
N        LEAVE_FF(fp->fs, FR_INT_ERR);
X        return FR_INT_ERR;
N    if (!(fp->flag & FA_READ))                  /* Check access mode */
X    if (!(fp->flag & 0x01))                   
N        LEAVE_FF(fp->fs, FR_DENIED);
X        return FR_DENIED;
N    remain = fp->fsize - fp->fptr;
N    if (btr > remain) btr = (UINT)remain;       /* Truncate btr by remaining bytes */
N
N    for ( ;  btr;                               /* Repeat until all data read */
N        rbuff += rcnt, fp->fptr += rcnt, *br += rcnt, btr -= rcnt) {
N        if ((fp->fptr % SS(fp->fs)) == 0) {     /* On the sector boundary? */
X        if ((fp->fptr % 512U) == 0) {      
N            csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));    /* Sector offset in the cluster */
X            csect = (BYTE)(fp->fptr / 512U & (fp->fs->csize - 1));     
N            if (!csect) {                       /* On the cluster boundary? */
N                if (fp->fptr == 0) {            /* On the top of the file? */
N                    clst = fp->sclust;          /* Follow from the origin */
N                } else {                        /* Middle or end of the file */
N#if _USE_FASTSEEK
X#if 0
S                    if (fp->cltbl)
S                        clst = clmt_clust(fp, fp->fptr);    /* Get cluster# from the CLMT */
S                    else
N#endif
N                        clst = get_fat(fp->fs, fp->clust);  /* Follow cluster chain on the FAT */
N                }
N                if (clst < 2) ABORT(fp->fs, FR_INT_ERR);
X                if (clst < 2) { fp->flag |= 0x80; return FR_INT_ERR; };
N                if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
X                if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
N                fp->clust = clst;               /* Update current cluster */
N            }
N            sect = clust2sect(fp->fs, fp->clust);   /* Get current sector */
N            if (!sect) ABORT(fp->fs, FR_INT_ERR);
X            if (!sect) { fp->flag |= 0x80; return FR_INT_ERR; };
N            sect += csect;
N            cc = btr / SS(fp->fs);              /* When remaining bytes >= sector size, */
X            cc = btr / 512U;               
N            if (cc) {                           /* Read maximum contiguous sectors directly */
N                if (csect + cc > fp->fs->csize) /* Clip at cluster boundary */
N                    cc = fp->fs->csize - csect;
N                if (disk_read(fp->fs->drv, rbuff, sect, (BYTE)cc) != RES_OK)
N                    ABORT(fp->fs, FR_DISK_ERR);
X                    { fp->flag |= 0x80; return FR_DISK_ERR; };
N#if !_FS_READONLY && _FS_MINIMIZE <= 2          /* Replace one of the read sectors with cached data if it contains a dirty sector */
X#if !0 && 0 <= 2           
N#if _FS_TINY
X#if 0
S                if (fp->fs->wflag && fp->fs->winsect - sect < cc)
S                    mem_cpy(rbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), fp->fs->win, SS(fp->fs));
N#else
N                if ((fp->flag & FA__DIRTY) && fp->dsect - sect < cc)
X                if ((fp->flag & 0x40) && fp->dsect - sect < cc)
N                    mem_cpy(rbuff + ((fp->dsect - sect) * SS(fp->fs)), fp->buf, SS(fp->fs));
X                    mem_cpy(rbuff + ((fp->dsect - sect) * 512U), fp->buf, 512U);
N#endif
N#endif
N                rcnt = SS(fp->fs) * cc;         /* Number of bytes transferred */
X                rcnt = 512U * cc;          
N                continue;
N            }
N#if !_FS_TINY
X#if !0
N            if (fp->dsect != sect) {            /* Load data sector if not in cache */
N#if !_FS_READONLY
X#if !0
N                if (fp->flag & FA__DIRTY) {     /* Write-back dirty sector cache */
X                if (fp->flag & 0x40) {      
N                    if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
N                        ABORT(fp->fs, FR_DISK_ERR);
X                        { fp->flag |= 0x80; return FR_DISK_ERR; };
N                    fp->flag &= ~FA__DIRTY;
X                    fp->flag &= ~0x40;
N                }
N#endif
N                if (disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK) /* Fill sector cache */
N                    ABORT(fp->fs, FR_DISK_ERR);
X                    { fp->flag |= 0x80; return FR_DISK_ERR; };
N            }
N#endif
N            fp->dsect = sect;
N        }
N        rcnt = SS(fp->fs) - ((UINT)fp->fptr % SS(fp->fs));  /* Get partial sector data from sector buffer */
X        rcnt = 512U - ((UINT)fp->fptr % 512U);   
N        if (rcnt > btr) rcnt = btr;
N#if _FS_TINY
X#if 0
S        if (move_window(fp->fs, fp->dsect))     /* Move sector window */
S            ABORT(fp->fs, FR_DISK_ERR);
S        mem_cpy(rbuff, &fp->fs->win[fp->fptr % SS(fp->fs)], rcnt);  /* Pick partial sector */
N#else
N        mem_cpy(rbuff, &fp->buf[fp->fptr % SS(fp->fs)], rcnt);  /* Pick partial sector */
X        mem_cpy(rbuff, &fp->buf[fp->fptr % 512U], rcnt);   
N#endif
N    }
N
N    LEAVE_FF(fp->fs, FR_OK);
X    return FR_OK;
R "../ff.c" 2467 19 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N#if !_FS_READONLY
X#if !0
N/*-----------------------------------------------------------------------*/
N/* Write File                                                            */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_write (
N    FIL *fp,            /* Pointer to the file object */
N    const void *buff,   /* Pointer to the data to be written */
N    UINT btw,           /* Number of bytes to write */
N    UINT *bw            /* Pointer to number of bytes written */
N)
N{
N    FRESULT res;
N    DWORD clst, sect;
N    UINT wcnt, cc;
N    const BYTE *wbuff = (const BYTE*)buff;
N    BYTE csect;
N
N
N    *bw = 0;    /* Clear write byte counter */
N
N    res = validate(fp);                     /* Check validity */
N    if (res != FR_OK) LEAVE_FF(fp->fs, res);
X    if (res != FR_OK) return res;
N    if (fp->flag & FA__ERROR)               /* Aborted file? */
X    if (fp->flag & 0x80)                
N        LEAVE_FF(fp->fs, FR_INT_ERR);
X        return FR_INT_ERR;
N    if (!(fp->flag & FA_WRITE))             /* Check access mode */
X    if (!(fp->flag & 0x02))              
N        LEAVE_FF(fp->fs, FR_DENIED);
X        return FR_DENIED;
N    if ((DWORD)(fp->fsize + btw) < fp->fsize) btw = 0;  /* File size cannot reach 4GB */
N
N    for ( ;  btw;                           /* Repeat until all data written */
N        wbuff += wcnt, fp->fptr += wcnt, *bw += wcnt, btw -= wcnt) {
N        if ((fp->fptr % SS(fp->fs)) == 0) { /* On the sector boundary? */
X        if ((fp->fptr % 512U) == 0) {  
N            csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));    /* Sector offset in the cluster */
X            csect = (BYTE)(fp->fptr / 512U & (fp->fs->csize - 1));     
N            if (!csect) {                   /* On the cluster boundary? */
N                if (fp->fptr == 0) {        /* On the top of the file? */
N                    clst = fp->sclust;      /* Follow from the origin */
N                    if (clst == 0)          /* When no cluster is allocated, */
N                        fp->sclust = clst = create_chain(fp->fs, 0);    /* Create a new cluster chain */
N                } else {                    /* Middle or end of the file */
N#if _USE_FASTSEEK
X#if 0
S                    if (fp->cltbl)
S                        clst = clmt_clust(fp, fp->fptr);    /* Get cluster# from the CLMT */
S                    else
N#endif
N                        clst = create_chain(fp->fs, fp->clust); /* Follow or stretch cluster chain on the FAT */
N                }
N                if (clst == 0) break;       /* Could not allocate a new cluster (disk full) */
N                if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
X                if (clst == 1) { fp->flag |= 0x80; return FR_INT_ERR; };
N                if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
X                if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
N                fp->clust = clst;           /* Update current cluster */
N            }
N#if _FS_TINY
X#if 0
S            if (fp->fs->winsect == fp->dsect && sync_window(fp->fs))    /* Write-back sector cache */
S                ABORT(fp->fs, FR_DISK_ERR);
N#else
N            if (fp->flag & FA__DIRTY) {     /* Write-back sector cache */
X            if (fp->flag & 0x40) {      
N                if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
N                    ABORT(fp->fs, FR_DISK_ERR);
X                    { fp->flag |= 0x80; return FR_DISK_ERR; };
N                fp->flag &= ~FA__DIRTY;
X                fp->flag &= ~0x40;
N            }
N#endif
N            sect = clust2sect(fp->fs, fp->clust);   /* Get current sector */
N            if (!sect) ABORT(fp->fs, FR_INT_ERR);
X            if (!sect) { fp->flag |= 0x80; return FR_INT_ERR; };
N            sect += csect;
N            cc = btw / SS(fp->fs);          /* When remaining bytes >= sector size, */
X            cc = btw / 512U;           
N            if (cc) {                       /* Write maximum contiguous sectors directly */
N                if (csect + cc > fp->fs->csize) /* Clip at cluster boundary */
N                    cc = fp->fs->csize - csect;
N                if (disk_write(fp->fs->drv, wbuff, sect, (BYTE)cc) != RES_OK)
N                    ABORT(fp->fs, FR_DISK_ERR);
X                    { fp->flag |= 0x80; return FR_DISK_ERR; };
N#if _FS_TINY
X#if 0
S                if (fp->fs->winsect - sect < cc) {  /* Refill sector cache if it gets invalidated by the direct write */
S                    mem_cpy(fp->fs->win, wbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), SS(fp->fs));
S                    fp->fs->wflag = 0;
S                }
N#else
N                if (fp->dsect - sect < cc) { /* Refill sector cache if it gets invalidated by the direct write */
N                    mem_cpy(fp->buf, wbuff + ((fp->dsect - sect) * SS(fp->fs)), SS(fp->fs));
X                    mem_cpy(fp->buf, wbuff + ((fp->dsect - sect) * 512U), 512U);
N                    fp->flag &= ~FA__DIRTY;
X                    fp->flag &= ~0x40;
N                }
N#endif
N                wcnt = SS(fp->fs) * cc;     /* Number of bytes transferred */
X                wcnt = 512U * cc;      
N                continue;
N            }
N#if _FS_TINY
X#if 0
S            if (fp->fptr >= fp->fsize) {    /* Avoid silly cache filling at growing edge */
S                if (sync_window(fp->fs)) ABORT(fp->fs, FR_DISK_ERR);
S                fp->fs->winsect = sect;
S            }
N#else
N            if (fp->dsect != sect) {        /* Fill sector cache with file data */
N                if (fp->fptr < fp->fsize &&
N                    disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)
N                        ABORT(fp->fs, FR_DISK_ERR);
X                        { fp->flag |= 0x80; return FR_DISK_ERR; };
N            }
N#endif
N            fp->dsect = sect;
N        }
N        wcnt = SS(fp->fs) - ((UINT)fp->fptr % SS(fp->fs));/* Put partial sector into file I/O buffer */
X        wcnt = 512U - ((UINT)fp->fptr % 512U); 
N        if (wcnt > btw) wcnt = btw;
N#if _FS_TINY
X#if 0
S        if (move_window(fp->fs, fp->dsect)) /* Move sector window */
S            ABORT(fp->fs, FR_DISK_ERR);
S        mem_cpy(&fp->fs->win[fp->fptr % SS(fp->fs)], wbuff, wcnt);  /* Fit partial sector */
S        fp->fs->wflag = 1;
N#else
N        mem_cpy(&fp->buf[fp->fptr % SS(fp->fs)], wbuff, wcnt);  /* Fit partial sector */
X        mem_cpy(&fp->buf[fp->fptr % 512U], wbuff, wcnt);   
N        fp->flag |= FA__DIRTY;
X        fp->flag |= 0x40;
N#endif
N    }
N
N    if (fp->fptr > fp->fsize) fp->fsize = fp->fptr; /* Update file size if needed */
N    fp->flag |= FA__WRITTEN;                        /* Set file change flag */
X    fp->flag |= 0x20;                         
N
N    LEAVE_FF(fp->fs, FR_OK);
X    return FR_OK;
R "../ff.c" 2568 19 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Synchronize the File Object                                           */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_sync (
N    FIL *fp     /* Pointer to the file object */
N)
N{
N    FRESULT res;
N    DWORD tm;
N    BYTE *dir;
N
N
N    res = validate(fp);                 /* Check validity of the object */
N    if (res == FR_OK) {
N        if (fp->flag & FA__WRITTEN) {   /* Has the file been written? */
X        if (fp->flag & 0x20) {    
N#if !_FS_TINY   /* Write-back dirty buffer */
X#if !0    
N            if (fp->flag & FA__DIRTY) {
X            if (fp->flag & 0x40) {
N                if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
N                    LEAVE_FF(fp->fs, FR_DISK_ERR);
X                    return FR_DISK_ERR;
N                fp->flag &= ~FA__DIRTY;
X                fp->flag &= ~0x40;
N            }
N#endif
N            /* Update the directory entry */
N            res = move_window(fp->fs, fp->dir_sect);
N            if (res == FR_OK) {
N                dir = fp->dir_ptr;
N                dir[DIR_Attr] |= AM_ARC;                    /* Set archive bit */
X                dir[11] |= 0x20;                     
N                ST_DWORD(dir+DIR_FileSize, fp->fsize);      /* Update file size */
X                *(BYTE*)(dir+28)=(BYTE)(fp->fsize); *((BYTE*)(dir+28)+1)=(BYTE)((WORD)(fp->fsize)>>8); *((BYTE*)(dir+28)+2)=(BYTE)((DWORD)(fp->fsize)>>16); *((BYTE*)(dir+28)+3)=(BYTE)((DWORD)(fp->fsize)>>24);       
N                st_clust(dir, fp->sclust);                  /* Update start cluster */
N                tm = get_fattime();                         /* Update updated time */
N                ST_DWORD(dir+DIR_WrtTime, tm);
X                *(BYTE*)(dir+22)=(BYTE)(tm); *((BYTE*)(dir+22)+1)=(BYTE)((WORD)(tm)>>8); *((BYTE*)(dir+22)+2)=(BYTE)((DWORD)(tm)>>16); *((BYTE*)(dir+22)+3)=(BYTE)((DWORD)(tm)>>24);
N                ST_WORD(dir+DIR_LstAccDate, 0);
X                *(BYTE*)(dir+18)=(BYTE)(0); *((BYTE*)(dir+18)+1)=(BYTE)((WORD)(0)>>8);
N                fp->flag &= ~FA__WRITTEN;
X                fp->flag &= ~0x20;
N                fp->fs->wflag = 1;
N                res = sync_fs(fp->fs);
N            }
N        }
N    }
N
N    LEAVE_FF(fp->fs, res);
X    return res;
N}
N
N#endif /* !_FS_READONLY */
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Close File                                                            */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_close (
N    FIL *fp     /* Pointer to the file object to be closed */
N)
N{
N    FRESULT res;
N
N
N#if _FS_READONLY
X#if 0
S    res = validate(fp);
S    {
S#if _FS_REENTRANT
S        FATFS *fs = fp->fs;
S#endif
S        if (res == FR_OK) fp->fs = 0;   /* Discard file object */
S        LEAVE_FF(fs, res);
S    }
N#else
N    res = f_sync(fp);       /* Flush cached data */
N#if _FS_LOCK
X#if 0
S    if (res == FR_OK) {     /* Decrement open counter */
S#if _FS_REENTRANT
S        FATFS *fs = fp->fs;;
S        res = validate(fp);
S        if (res == FR_OK) {
S            res = dec_lock(fp->lockid);
S            unlock_fs(fs, FR_OK);
S        }
S#else
S        res = dec_lock(fp->lockid);
S#endif
S    }
N#endif
N    if (res == FR_OK) fp->fs = 0;   /* Discard file object */
N    return res;
N#endif
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Current Drive/Directory Handlings                                     */
N/*-----------------------------------------------------------------------*/
N
N#if _FS_RPATH >= 1
X#if 0 >= 1
S
SFRESULT f_chdrive (
S    BYTE drv        /* Drive number */
S)
S{
S    if (drv >= _VOLUMES) return FR_INVALID_DRIVE;
S
S    CurrVol = drv;
S
S    return FR_OK;
S}
S
S
S
SFRESULT f_chdir (
S    const TCHAR *path   /* Pointer to the directory path */
S)
S{
S    FRESULT res;
S    DIR dj;
S    DEF_NAMEBUF;
S
S
S    res = chk_mounted(&path, &dj.fs, 0);
S    if (res == FR_OK) {
S        INIT_BUF(dj);
S        res = follow_path(&dj, path);       /* Follow the path */
S        FREE_BUF();
S        if (res == FR_OK) {                 /* Follow completed */
S            if (!dj.dir) {
S                dj.fs->cdir = dj.sclust;    /* Start directory itself */
S            } else {
S                if (dj.dir[DIR_Attr] & AM_DIR)  /* Reached to the directory */
S                    dj.fs->cdir = ld_clust(dj.fs, dj.dir);
S                else
S                    res = FR_NO_PATH;       /* Reached but a file */
S            }
S        }
S        if (res == FR_NO_FILE) res = FR_NO_PATH;
S    }
S
S    LEAVE_FF(dj.fs, res);
S}
S
S
S#if _FS_RPATH >= 2
SFRESULT f_getcwd (
S    TCHAR *buff,    /* Pointer to the directory path */
S    UINT len        /* Size of path */
S)
S{
S    FRESULT res;
S    DIR dj;
S    UINT i, n;
S    DWORD ccl;
S    TCHAR *tp;
S    FILINFO fno;
S    DEF_NAMEBUF;
S
S
S    *buff = 0;
S    res = chk_mounted((const TCHAR**)&buff, &dj.fs, 0); /* Get current volume */
S    if (res == FR_OK) {
S        INIT_BUF(dj);
S        i = len;            /* Bottom of buffer (dir stack base) */
S        dj.sclust = dj.fs->cdir;            /* Start to follow upper dir from current dir */
S        while ((ccl = dj.sclust) != 0) {    /* Repeat while current dir is a sub-dir */
S            res = dir_sdi(&dj, 1);          /* Get parent dir */
S            if (res != FR_OK) break;
S            res = dir_read(&dj, 0);
S            if (res != FR_OK) break;
S            dj.sclust = ld_clust(dj.fs, dj.dir);    /* Goto parent dir */
S            res = dir_sdi(&dj, 0);
S            if (res != FR_OK) break;
S            do {                            /* Find the entry links to the child dir */
S                res = dir_read(&dj, 0);
S                if (res != FR_OK) break;
S                if (ccl == ld_clust(dj.fs, dj.dir)) break;  /* Found the entry */
S                res = dir_next(&dj, 0);
S            } while (res == FR_OK);
S            if (res == FR_NO_FILE) res = FR_INT_ERR;/* It cannot be 'not found'. */
S            if (res != FR_OK) break;
S#if _USE_LFN
S            fno.lfname = buff;
S            fno.lfsize = i;
S#endif
S            get_fileinfo(&dj, &fno);        /* Get the dir name and push it to the buffer */
S            tp = fno.fname;
S            if (_USE_LFN && *buff) tp = buff;
S            for (n = 0; tp[n]; n++) ;
S            if (i < n + 3) {
S                res = FR_NOT_ENOUGH_CORE; break;
S            }
S            while (n) buff[--i] = tp[--n];
S            buff[--i] = '/';
S        }
S        tp = buff;
S        if (res == FR_OK) {
S            *tp++ = '0' + CurrVol;          /* Put drive number */
S            *tp++ = ':';
S            if (i == len) {                 /* Root-dir */
S                *tp++ = '/';
S            } else {                        /* Sub-dir */
S                do      /* Add stacked path str */
S                    *tp++ = buff[i++];
S                while (i < len);
S            }
S        }
S        *tp = 0;
S        FREE_BUF();
S    }
S
S    LEAVE_FF(dj.fs, res);
S}
S#endif /* _FS_RPATH >= 2 */
N#endif /* _FS_RPATH >= 1 */
N
N
N
N#if _FS_MINIMIZE <= 2
X#if 0 <= 2
N/*-----------------------------------------------------------------------*/
N/* Seek File R/W Pointer                                                 */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_lseek (
N    FIL *fp,        /* Pointer to the file object */
N    DWORD ofs       /* File pointer from top of file */
N)
N{
N    FRESULT res;
N
N
N    res = validate(fp);                 /* Check validity of the object */
N    if (res != FR_OK) LEAVE_FF(fp->fs, res);
X    if (res != FR_OK) return res;
N    if (fp->flag & FA__ERROR)           /* Check abort flag */
X    if (fp->flag & 0x80)            
N        LEAVE_FF(fp->fs, FR_INT_ERR);
X        return FR_INT_ERR;
N
N#if _USE_FASTSEEK
X#if 0
S    if (fp->cltbl) {    /* Fast seek */
S        DWORD cl, pcl, ncl, tcl, dsc, tlen, ulen, *tbl;
S
S        if (ofs == CREATE_LINKMAP) {    /* Create CLMT */
S            tbl = fp->cltbl;
S            tlen = *tbl++; ulen = 2;    /* Given table size and required table size */
S            cl = fp->sclust;            /* Top of the chain */
S            if (cl) {
S                do {
S                    /* Get a fragment */
S                    tcl = cl; ncl = 0; ulen += 2;   /* Top, length and used items */
S                    do {
S                        pcl = cl; ncl++;
S                        cl = get_fat(fp->fs, cl);
S                        if (cl <= 1) ABORT(fp->fs, FR_INT_ERR);
S                        if (cl == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
S                    } while (cl == pcl + 1);
S                    if (ulen <= tlen) {     /* Store the length and top of the fragment */
S                        *tbl++ = ncl; *tbl++ = tcl;
S                    }
S                } while (cl < fp->fs->n_fatent);    /* Repeat until end of chain */
S            }
S            *fp->cltbl = ulen;  /* Number of items used */
S            if (ulen <= tlen)
S                *tbl = 0;       /* Terminate table */
S            else
S                res = FR_NOT_ENOUGH_CORE;   /* Given table size is smaller than required */
S
S        } else {                        /* Fast seek */
S            if (ofs > fp->fsize)        /* Clip offset at the file size */
S                ofs = fp->fsize;
S            fp->fptr = ofs;             /* Set file pointer */
S            if (ofs) {
S                fp->clust = clmt_clust(fp, ofs - 1);
S                dsc = clust2sect(fp->fs, fp->clust);
S                if (!dsc) ABORT(fp->fs, FR_INT_ERR);
S                dsc += (ofs - 1) / SS(fp->fs) & (fp->fs->csize - 1);
S                if (fp->fptr % SS(fp->fs) && dsc != fp->dsect) {    /* Refill sector cache if needed */
S#if !_FS_TINY
S#if !_FS_READONLY
S                    if (fp->flag & FA__DIRTY) {     /* Write-back dirty sector cache */
S                        if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
S                            ABORT(fp->fs, FR_DISK_ERR);
S                        fp->flag &= ~FA__DIRTY;
S                    }
S#endif
S                    if (disk_read(fp->fs->drv, fp->buf, dsc, 1) != RES_OK)  /* Load current sector */
S                        ABORT(fp->fs, FR_DISK_ERR);
S#endif
S                    fp->dsect = dsc;
S                }
S            }
S        }
S    } else
N#endif
N
N    /* Normal Seek */
N    {
N        DWORD clst, bcs, nsect, ifptr;
N
N        if (ofs > fp->fsize                 /* In read-only mode, clip offset with the file size */
N#if !_FS_READONLY
X#if !0
N             && !(fp->flag & FA_WRITE)
X             && !(fp->flag & 0x02)
N#endif
N            ) ofs = fp->fsize;
N
N        ifptr = fp->fptr;
N        fp->fptr = nsect = 0;
N        if (ofs) {
N            bcs = (DWORD)fp->fs->csize * SS(fp->fs);    /* Cluster size (byte) */
X            bcs = (DWORD)fp->fs->csize * 512U;     
N            if (ifptr > 0 &&
N                (ofs - 1) / bcs >= (ifptr - 1) / bcs) { /* When seek to same or following cluster, */
N                fp->fptr = (ifptr - 1) & ~(bcs - 1);    /* start from the current cluster */
N                ofs -= fp->fptr;
N                clst = fp->clust;
N            } else {                                    /* When seek to back cluster, */
N                clst = fp->sclust;                      /* start from the first cluster */
N#if !_FS_READONLY
X#if !0
N                if (clst == 0) {                        /* If no cluster chain, create a new chain */
N                    clst = create_chain(fp->fs, 0);
N                    if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
X                    if (clst == 1) { fp->flag |= 0x80; return FR_INT_ERR; };
N                    if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
X                    if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
N                    fp->sclust = clst;
N                }
N#endif
N                fp->clust = clst;
N            }
N            if (clst != 0) {
N                while (ofs > bcs) {                     /* Cluster following loop */
N#if !_FS_READONLY
X#if !0
N                    if (fp->flag & FA_WRITE) {          /* Check if in write mode or not */
X                    if (fp->flag & 0x02) {           
N                        clst = create_chain(fp->fs, clst);  /* Force stretch if in write mode */
N                        if (clst == 0) {                /* When disk gets full, clip file size */
N                            ofs = bcs; break;
N                        }
N                    } else
N#endif
N                        clst = get_fat(fp->fs, clst);   /* Follow cluster chain if not in write mode */
N                    if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
X                    if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
N                    if (clst <= 1 || clst >= fp->fs->n_fatent) ABORT(fp->fs, FR_INT_ERR);
X                    if (clst <= 1 || clst >= fp->fs->n_fatent) { fp->flag |= 0x80; return FR_INT_ERR; };
N                    fp->clust = clst;
N                    fp->fptr += bcs;
N                    ofs -= bcs;
N                }
N                fp->fptr += ofs;
N                if (ofs % SS(fp->fs)) {
X                if (ofs % 512U) {
N                    nsect = clust2sect(fp->fs, clst);   /* Current sector */
N                    if (!nsect) ABORT(fp->fs, FR_INT_ERR);
X                    if (!nsect) { fp->flag |= 0x80; return FR_INT_ERR; };
N                    nsect += ofs / SS(fp->fs);
X                    nsect += ofs / 512U;
N                }
N            }
N        }
N        if (fp->fptr % SS(fp->fs) && nsect != fp->dsect) {  /* Fill sector cache if needed */
X        if (fp->fptr % 512U && nsect != fp->dsect) {   
N#if !_FS_TINY
X#if !0
N#if !_FS_READONLY
X#if !0
N            if (fp->flag & FA__DIRTY) {         /* Write-back dirty sector cache */
X            if (fp->flag & 0x40) {          
N                if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
N                    ABORT(fp->fs, FR_DISK_ERR);
X                    { fp->flag |= 0x80; return FR_DISK_ERR; };
N                fp->flag &= ~FA__DIRTY;
X                fp->flag &= ~0x40;
N            }
N#endif
N            if (disk_read(fp->fs->drv, fp->buf, nsect, 1) != RES_OK)    /* Fill sector cache */
N                ABORT(fp->fs, FR_DISK_ERR);
X                { fp->flag |= 0x80; return FR_DISK_ERR; };
N#endif
N            fp->dsect = nsect;
N        }
N#if !_FS_READONLY
X#if !0
N        if (fp->fptr > fp->fsize) {         /* Set file change flag if the file size is extended */
N            fp->fsize = fp->fptr;
N            fp->flag |= FA__WRITTEN;
X            fp->flag |= 0x20;
N        }
N#endif
N    }
N
N    LEAVE_FF(fp->fs, res);
X    return res;
N}
N
N
N
N#if _FS_MINIMIZE <= 1
X#if 0 <= 1
N/*-----------------------------------------------------------------------*/
N/* Create a Directory Object                                             */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_opendir (
N    DIR *dj,            /* Pointer to directory object to create */
N    const TCHAR *path   /* Pointer to the directory path */
N)
N{
N    FRESULT res;
N    FATFS *fs;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    if (!dj) return FR_INVALID_OBJECT;
N
N    res = chk_mounted(&path, &dj->fs, 0);
N    fs = dj->fs;
N    if (res == FR_OK) {
N        INIT_BUF(*dj);
X        (*dj). fn = sfn;
N        res = follow_path(dj, path);            /* Follow the path to the directory */
N        FREE_BUF();
X        ;
N        if (res == FR_OK) {                     /* Follow completed */
N            if (dj->dir) {                      /* It is not the root dir */
N                if (dj->dir[DIR_Attr] & AM_DIR) {   /* The object is a directory */
X                if (dj->dir[11] & 0x10) {    
N                    dj->sclust = ld_clust(fs, dj->dir);
N                } else {                        /* The object is not a directory */
N                    res = FR_NO_PATH;
N                }
N            }
N            if (res == FR_OK) {
N                dj->id = fs->id;
N                res = dir_sdi(dj, 0);           /* Rewind dir */
N            }
N        }
N        if (res == FR_NO_FILE) res = FR_NO_PATH;
N        if (res != FR_OK) dj->fs = 0;           /* Invalidate the dir object if function faild */
N    } else {
N        dj->fs = 0;
N    }
N
N    LEAVE_FF(fs, res);
X    return res;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Read Directory Entry in Sequence                                      */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_readdir (
N    DIR *dj,            /* Pointer to the open directory object */
N    FILINFO *fno        /* Pointer to file information to return */
N)
N{
N    FRESULT res;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    res = validate(dj);                     /* Check validity of the object */
N    if (res == FR_OK) {
N        if (!fno) {
N            res = dir_sdi(dj, 0);           /* Rewind the directory object */
N        } else {
N            INIT_BUF(*dj);
X            (*dj). fn = sfn;
N            res = dir_read(dj, 0);          /* Read an item */
N            if (res == FR_NO_FILE) {        /* Reached end of dir */
N                dj->sect = 0;
N                res = FR_OK;
N            }
N            if (res == FR_OK) {             /* A valid entry is found */
N                get_fileinfo(dj, fno);      /* Get the object information */
N                res = dir_next(dj, 0);      /* Increment index for next */
N                if (res == FR_NO_FILE) {
N                    dj->sect = 0;
N                    res = FR_OK;
N                }
N            }
N            FREE_BUF();
X            ;
N        }
N    }
N
N    LEAVE_FF(dj->fs, res);
X    return res;
N}
N
N
N
N#if _FS_MINIMIZE == 0
X#if 0 == 0
N/*-----------------------------------------------------------------------*/
N/* Get File Status                                                       */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_stat (
N    const TCHAR *path,  /* Pointer to the file path */
N    FILINFO *fno        /* Pointer to file information to return */
N)
N{
N    FRESULT res;
N    DIR dj;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    res = chk_mounted(&path, &dj.fs, 0);
N    if (res == FR_OK) {
N        INIT_BUF(dj);
X        (dj). fn = sfn;
N        res = follow_path(&dj, path);   /* Follow the file path */
N        if (res == FR_OK) {             /* Follow completed */
N            if (dj.dir)     /* Found an object */
N                get_fileinfo(&dj, fno);
N            else            /* It is root dir */
N                res = FR_INVALID_NAME;
N        }
N        FREE_BUF();
X        ;
N    }
N
N    LEAVE_FF(dj.fs, res);
X    return res;
N}
N
N
N
N#if !_FS_READONLY
X#if !0
N/*-----------------------------------------------------------------------*/
N/* Get Number of Free Clusters                                           */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_getfree (
N    const TCHAR *path,  /* Path name of the logical drive number */
N    DWORD *nclst,       /* Pointer to a variable to return number of free clusters */
N    FATFS **fatfs       /* Pointer to return pointer to corresponding file system object */
N)
N{
N    FRESULT res;
N    FATFS *fs;
N    DWORD n, clst, sect, stat;
N    UINT i;
N    BYTE fat, *p;
N
N
N    /* Get drive number */
N    res = chk_mounted(&path, fatfs, 0);
N    fs = *fatfs;
N    if (res == FR_OK) {
N        /* If free_clust is valid, return it without full cluster scan */
N        if (fs->free_clust <= fs->n_fatent - 2) {
N            *nclst = fs->free_clust;
N        } else {
N            /* Get number of free clusters */
N            fat = fs->fs_type;
N            n = 0;
N            if (fat == FS_FAT12) {
X            if (fat == 1) {
N                clst = 2;
N                do {
N                    stat = get_fat(fs, clst);
N                    if (stat == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }
N                    if (stat == 1) { res = FR_INT_ERR; break; }
N                    if (stat == 0) n++;
N                } while (++clst < fs->n_fatent);
N            } else {
N                clst = fs->n_fatent;
N                sect = fs->fatbase;
N                i = 0; p = 0;
N                do {
N                    if (!i) {
N                        res = move_window(fs, sect++);
N                        if (res != FR_OK) break;
N                        p = fs->win;
N                        i = SS(fs);
X                        i = 512U;
N                    }
N                    if (fat == FS_FAT16) {
X                    if (fat == 2) {
N                        if (LD_WORD(p) == 0) n++;
X                        if ((WORD)(((WORD)*((BYTE*)(p)+1)<<8)|(WORD)*(BYTE*)(p)) == 0) n++;
N                        p += 2; i -= 2;
N                    } else {
N                        if ((LD_DWORD(p) & 0x0FFFFFFF) == 0) n++;
X                        if (((DWORD)(((DWORD)*((BYTE*)(p)+3)<<24)|((DWORD)*((BYTE*)(p)+2)<<16)|((WORD)*((BYTE*)(p)+1)<<8)| *(BYTE*)(p)) & 0x0FFFFFFF) == 0) n++;
N                        p += 4; i -= 4;
N                    }
N                } while (--clst);
N            }
N            fs->free_clust = n;
N            if (fat == FS_FAT32) fs->fsi_flag = 1;
X            if (fat == 3) fs->fsi_flag = 1;
N            *nclst = n;
N        }
N    }
N    LEAVE_FF(fs, res);
X    return res;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Truncate File                                                         */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_truncate (
N    FIL *fp     /* Pointer to the file object */
N)
N{
N    FRESULT res;
N    DWORD ncl;
N
N
N    res = validate(fp);                     /* Check validity of the object */
N    if (res == FR_OK) {
N        if (fp->flag & FA__ERROR) {         /* Check abort flag */
X        if (fp->flag & 0x80) {          
N            res = FR_INT_ERR;
N        } else {
N            if (!(fp->flag & FA_WRITE))     /* Check access mode */
X            if (!(fp->flag & 0x02))      
N                res = FR_DENIED;
N        }
N    }
N    if (res == FR_OK) {
N        if (fp->fsize > fp->fptr) {
N            fp->fsize = fp->fptr;   /* Set file size to current R/W point */
N            fp->flag |= FA__WRITTEN;
X            fp->flag |= 0x20;
N            if (fp->fptr == 0) {    /* When set file size to zero, remove entire cluster chain */
N                res = remove_chain(fp->fs, fp->sclust);
N                fp->sclust = 0;
N            } else {                /* When truncate a part of the file, remove remaining clusters */
N                ncl = get_fat(fp->fs, fp->clust);
N                res = FR_OK;
N                if (ncl == 0xFFFFFFFF) res = FR_DISK_ERR;
N                if (ncl == 1) res = FR_INT_ERR;
N                if (res == FR_OK && ncl < fp->fs->n_fatent) {
N                    res = put_fat(fp->fs, fp->clust, 0x0FFFFFFF);
N                    if (res == FR_OK) res = remove_chain(fp->fs, ncl);
N                }
N            }
N        }
N        if (res != FR_OK) fp->flag |= FA__ERROR;
X        if (res != FR_OK) fp->flag |= 0x80;
N    }
N
N    LEAVE_FF(fp->fs, res);
X    return res;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Delete a File or Directory                                            */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_unlink (
N    const TCHAR *path       /* Pointer to the file or directory path */
N)
N{
N    FRESULT res;
N    DIR dj, sdj;
N    BYTE *dir;
N    DWORD dclst;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    res = chk_mounted(&path, &dj.fs, 1);
N    if (res == FR_OK) {
N        INIT_BUF(dj);
X        (dj). fn = sfn;
N        res = follow_path(&dj, path);       /* Follow the file path */
N        if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
X        if (0 && res == FR_OK && (dj.fn[11] & 0x20))
N            res = FR_INVALID_NAME;          /* Cannot remove dot entry */
N#if _FS_LOCK
X#if 0
S        if (res == FR_OK) res = chk_lock(&dj, 2);   /* Cannot remove open file */
N#endif
N        if (res == FR_OK) {                 /* The object is accessible */
N            dir = dj.dir;
N            if (!dir) {
N                res = FR_INVALID_NAME;      /* Cannot remove the start directory */
N            } else {
N                if (dir[DIR_Attr] & AM_RDO)
X                if (dir[11] & 0x01)
N                    res = FR_DENIED;        /* Cannot remove R/O object */
N            }
N            dclst = ld_clust(dj.fs, dir);
N            if (res == FR_OK && (dir[DIR_Attr] & AM_DIR)) { /* Is it a sub-dir? */
X            if (res == FR_OK && (dir[11] & 0x10)) {  
N                if (dclst < 2) {
N                    res = FR_INT_ERR;
N                } else {
N                    mem_cpy(&sdj, &dj, sizeof (DIR));   /* Check if the sub-dir is empty or not */
N                    sdj.sclust = dclst;
N                    res = dir_sdi(&sdj, 2);     /* Exclude dot entries */
N                    if (res == FR_OK) {
N                        res = dir_read(&sdj, 0);    /* Read an item */
N                        if (res == FR_OK        /* Not empty dir */
N#if _FS_RPATH
X#if 0
S                        || dclst == dj.fs->cdir /* Current dir */
N#endif
N                        ) res = FR_DENIED;
N                        if (res == FR_NO_FILE) res = FR_OK; /* Empty */
N                    }
N                }
N            }
N            if (res == FR_OK) {
N                res = dir_remove(&dj);      /* Remove the directory entry */
N                if (res == FR_OK) {
N                    if (dclst)              /* Remove the cluster chain if exist */
N                        res = remove_chain(dj.fs, dclst);
N                    if (res == FR_OK) res = sync_fs(dj.fs);
N                }
N            }
N        }
N        FREE_BUF();
X        ;
N    }
N
N    LEAVE_FF(dj.fs, res);
X    return res;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Create a Directory                                                    */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_mkdir (
N    const TCHAR *path       /* Pointer to the directory path */
N)
N{
N    FRESULT res;
N    DIR dj;
N    BYTE *dir, n;
N    DWORD dsc, dcl, pcl, tm = get_fattime();
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    res = chk_mounted(&path, &dj.fs, 1);
N    if (res == FR_OK) {
N        INIT_BUF(dj);
X        (dj). fn = sfn;
N        res = follow_path(&dj, path);           /* Follow the file path */
N        if (res == FR_OK) res = FR_EXIST;       /* Any object with same name is already existing */
N        if (_FS_RPATH && res == FR_NO_FILE && (dj.fn[NS] & NS_DOT))
X        if (0 && res == FR_NO_FILE && (dj.fn[11] & 0x20))
N            res = FR_INVALID_NAME;
N        if (res == FR_NO_FILE) {                /* Can create a new directory */
N            dcl = create_chain(dj.fs, 0);       /* Allocate a cluster for the new directory table */
N            res = FR_OK;
N            if (dcl == 0) res = FR_DENIED;      /* No space to allocate a new cluster */
N            if (dcl == 1) res = FR_INT_ERR;
N            if (dcl == 0xFFFFFFFF) res = FR_DISK_ERR;
N            if (res == FR_OK)                   /* Flush FAT */
N                res = sync_window(dj.fs);
N            if (res == FR_OK) {                 /* Initialize the new directory table */
N                dsc = clust2sect(dj.fs, dcl);
N                dir = dj.fs->win;
N                mem_set(dir, 0, SS(dj.fs));
X                mem_set(dir, 0, 512U);
N                mem_set(dir+DIR_Name, ' ', 11); /* Create "." entry */
X                mem_set(dir+0, ' ', 11);  
N                dir[DIR_Name] = '.';
X                dir[0] = '.';
N                dir[DIR_Attr] = AM_DIR;
X                dir[11] = 0x10;
N                ST_DWORD(dir+DIR_WrtTime, tm);
X                *(BYTE*)(dir+22)=(BYTE)(tm); *((BYTE*)(dir+22)+1)=(BYTE)((WORD)(tm)>>8); *((BYTE*)(dir+22)+2)=(BYTE)((DWORD)(tm)>>16); *((BYTE*)(dir+22)+3)=(BYTE)((DWORD)(tm)>>24);
N                st_clust(dir, dcl);
N                mem_cpy(dir+SZ_DIR, dir, SZ_DIR);   /* Create ".." entry */
X                mem_cpy(dir+32, dir, 32);    
N                dir[33] = '.'; pcl = dj.sclust;
N                if (dj.fs->fs_type == FS_FAT32 && pcl == dj.fs->dirbase)
X                if (dj.fs->fs_type == 3 && pcl == dj.fs->dirbase)
N                    pcl = 0;
N                st_clust(dir+SZ_DIR, pcl);
X                st_clust(dir+32, pcl);
N                for (n = dj.fs->csize; n; n--) {    /* Write dot entries and clear following sectors */
N                    dj.fs->winsect = dsc++;
N                    dj.fs->wflag = 1;
N                    res = sync_window(dj.fs);
N                    if (res != FR_OK) break;
N                    mem_set(dir, 0, SS(dj.fs));
X                    mem_set(dir, 0, 512U);
N                }
N            }
N            if (res == FR_OK) res = dir_register(&dj);  /* Register the object to the directoy */
N            if (res != FR_OK) {
N                remove_chain(dj.fs, dcl);           /* Could not register, remove cluster chain */
N            } else {
N                dir = dj.dir;
N                dir[DIR_Attr] = AM_DIR;             /* Attribute */
X                dir[11] = 0x10;              
N                ST_DWORD(dir+DIR_WrtTime, tm);      /* Created time */
X                *(BYTE*)(dir+22)=(BYTE)(tm); *((BYTE*)(dir+22)+1)=(BYTE)((WORD)(tm)>>8); *((BYTE*)(dir+22)+2)=(BYTE)((DWORD)(tm)>>16); *((BYTE*)(dir+22)+3)=(BYTE)((DWORD)(tm)>>24);       
N                st_clust(dir, dcl);                 /* Table start cluster */
N                dj.fs->wflag = 1;
N                res = sync_fs(dj.fs);
N            }
N        }
N        FREE_BUF();
X        ;
N    }
N
N    LEAVE_FF(dj.fs, res);
X    return res;
R "../ff.c" 3381 44 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Change Attribute                                                      */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_chmod (
N    const TCHAR *path,  /* Pointer to the file path */
N    BYTE value,         /* Attribute bits */
N    BYTE mask           /* Attribute mask to change */
N)
N{
N    FRESULT res;
N    DIR dj;
N    BYTE *dir;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    res = chk_mounted(&path, &dj.fs, 1);
N    if (res == FR_OK) {
N        INIT_BUF(dj);
X        (dj). fn = sfn;
N        res = follow_path(&dj, path);       /* Follow the file path */
N        FREE_BUF();
X        ;
N        if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
X        if (0 && res == FR_OK && (dj.fn[11] & 0x20))
N            res = FR_INVALID_NAME;
N        if (res == FR_OK) {
N            dir = dj.dir;
N            if (!dir) {                     /* Is it a root directory? */
N                res = FR_INVALID_NAME;
N            } else {                        /* File or sub directory */
N                mask &= AM_RDO|AM_HID|AM_SYS|AM_ARC;    /* Valid attribute mask */
X                mask &= 0x01|0x02|0x04|0x20;     
N                dir[DIR_Attr] = (value & mask) | (dir[DIR_Attr] & (BYTE)~mask); /* Apply attribute change */
X                dir[11] = (value & mask) | (dir[11] & (BYTE)~mask);  
N                dj.fs->wflag = 1;
N                res = sync_fs(dj.fs);
N            }
N        }
N    }
N
N    LEAVE_FF(dj.fs, res);
X    return res;
R "../ff.c" 3438 22 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Change Timestamp                                                      */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_utime (
N    const TCHAR *path,  /* Pointer to the file/directory name */
N    const FILINFO *fno  /* Pointer to the time stamp to be set */
N)
N{
N    FRESULT res;
N    DIR dj;
N    BYTE *dir;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    res = chk_mounted(&path, &dj.fs, 1);
N    if (res == FR_OK) {
N        INIT_BUF(dj);
X        (dj). fn = sfn;
N        res = follow_path(&dj, path);   /* Follow the file path */
N        FREE_BUF();
X        ;
N        if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
X        if (0 && res == FR_OK && (dj.fn[11] & 0x20))
N            res = FR_INVALID_NAME;
N        if (res == FR_OK) {
N            dir = dj.dir;
N            if (!dir) {                 /* Root directory */
N                res = FR_INVALID_NAME;
N            } else {                    /* File or sub-directory */
N                ST_WORD(dir+DIR_WrtTime, fno->ftime);
X                *(BYTE*)(dir+22)=(BYTE)(fno->ftime); *((BYTE*)(dir+22)+1)=(BYTE)((WORD)(fno->ftime)>>8);
N                ST_WORD(dir+DIR_WrtDate, fno->fdate);
X                *(BYTE*)(dir+24)=(BYTE)(fno->fdate); *((BYTE*)(dir+24)+1)=(BYTE)((WORD)(fno->fdate)>>8);
N                dj.fs->wflag = 1;
N                res = sync_fs(dj.fs);
N            }
N        }
N    }
N
N    LEAVE_FF(dj.fs, res);
X    return res;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Rename File/Directory                                                 */
N/*-----------------------------------------------------------------------*/
N
NFRESULT f_rename (
N    const TCHAR *path_old,  /* Pointer to the old name */
N    const TCHAR *path_new   /* Pointer to the new name */
N)
N{
N    FRESULT res;
N    DIR djo, djn;
N    BYTE buf[21], *dir;
N    DWORD dw;
N    DEF_NAMEBUF;
X    BYTE sfn[12];
N
N
N    res = chk_mounted(&path_old, &djo.fs, 1);
N    if (res == FR_OK) {
N        djn.fs = djo.fs;
N        INIT_BUF(djo);
X        (djo). fn = sfn;
N        res = follow_path(&djo, path_old);      /* Check old object */
N        if (_FS_RPATH && res == FR_OK && (djo.fn[NS] & NS_DOT))
X        if (0 && res == FR_OK && (djo.fn[11] & 0x20))
N            res = FR_INVALID_NAME;
N#if _FS_LOCK
X#if 0
S        if (res == FR_OK) res = chk_lock(&djo, 2);
N#endif
N        if (res == FR_OK) {                     /* Old object is found */
N            if (!djo.dir) {                     /* Is root dir? */
N                res = FR_NO_FILE;
N            } else {
N                mem_cpy(buf, djo.dir+DIR_Attr, 21);     /* Save the object information except for name */
X                mem_cpy(buf, djo.dir+11, 21);      
N                mem_cpy(&djn, &djo, sizeof (DIR));      /* Check new object */
N                res = follow_path(&djn, path_new);
N                if (res == FR_OK) res = FR_EXIST;       /* The new object name is already existing */
N                if (res == FR_NO_FILE) {                /* Is it a valid path and no name collision? */
N/* Start critical section that any interruption can cause a cross-link */
N                    res = dir_register(&djn);           /* Register the new entry */
N                    if (res == FR_OK) {
N                        dir = djn.dir;                  /* Copy object information except for name */
N                        mem_cpy(dir+13, buf+2, 19);
N                        dir[DIR_Attr] = buf[0] | AM_ARC;
X                        dir[11] = buf[0] | 0x20;
N                        djo.fs->wflag = 1;
N                        if (djo.sclust != djn.sclust && (dir[DIR_Attr] & AM_DIR)) {     /* Update .. entry in the directory if needed */
X                        if (djo.sclust != djn.sclust && (dir[11] & 0x10)) {      
N                            dw = clust2sect(djo.fs, ld_clust(djo.fs, dir));
N                            if (!dw) {
N                                res = FR_INT_ERR;
N                            } else {
N                                res = move_window(djo.fs, dw);
N                                dir = djo.fs->win+SZ_DIR;   /* .. entry */
X                                dir = djo.fs->win+32;    
N                                if (res == FR_OK && dir[1] == '.') {
N                                    dw = (djo.fs->fs_type == FS_FAT32 && djn.sclust == djo.fs->dirbase) ? 0 : djn.sclust;
X                                    dw = (djo.fs->fs_type == 3 && djn.sclust == djo.fs->dirbase) ? 0 : djn.sclust;
N                                    st_clust(dir, dw);
N                                    djo.fs->wflag = 1;
N                                }
N                            }
N                        }
N                        if (res == FR_OK) {
N                            res = dir_remove(&djo);     /* Remove old entry */
N                            if (res == FR_OK)
N                                res = sync_fs(djo.fs);
N                        }
N                    }
N/* End critical section */
N                }
N            }
N        }
N        FREE_BUF();
X        ;
N    }
N
N    LEAVE_FF(djo.fs, res);
X    return res;
N}
N
N#endif /* !_FS_READONLY */
N#endif /* _FS_MINIMIZE == 0 */
N#endif /* _FS_MINIMIZE <= 1 */
N#endif /* _FS_MINIMIZE <= 2 */
N
N
N
N#if _USE_LABEL
X#if 0
S/*-----------------------------------------------------------------------*/
S/* Get volume label                                                      */
S/*-----------------------------------------------------------------------*/
S
SFRESULT f_getlabel (
S    const TCHAR* path,  /* Path name of the logical drive number */
S    TCHAR* label,       /* Pointer to a buffer to return the volume label */
S    DWORD* sn           /* Pointer to a variable to return the volume serial number */
S)
S{
S    FRESULT res;
S    DIR dj;
S    UINT i, j;
S
S
S    /* Get logical drive */
S    res = chk_mounted(&path, &dj.fs, 0);
S
S    /* Get volume label */
S    if (res == FR_OK && label) {
S        dj.sclust = 0;                  /* Open root dir */
S        res = dir_sdi(&dj, 0);
S        if (res == FR_OK) {
S            res = dir_read(&dj, 1);     /* Get an entry with AM_VOL */
S            if (res == FR_OK) {         /* A volume label is exist */
S#if _LFN_UNICODE
S                WCHAR w;
S                i = j = 0;
S                do {
S                    w = (i < 11) ? dj.dir[i++] : ' ';
S                    if (IsDBCS1(w) && i < 11 && IsDBCS2(dj.dir[i]))
S                        w = (w << 8) | dj.dir[i++];
S                    label[j++] = ff_convert(w, 1);
S                } while (j < 11);
S#else
S                mem_cpy(label, dj.dir, 11);
S#endif
S                j = 11;
S                do {
S                    label[j] = 0;
S                    if (!j) break;
S                } while (label[--j] == ' ');
S            }
S            if (res == FR_NO_FILE) {    /* No label, return nul string */
S                label[0] = 0;
S                res = FR_OK;
S            }
S        }
S    }
S
S    /* Get volume serial number */
S    if (res == FR_OK && sn) {
S        res = move_window(dj.fs, dj.fs->volbase);
S        if (res == FR_OK) {
S            i = dj.fs->fs_type == FS_FAT32 ? BS_VolID32 : BS_VolID;
S            *sn = LD_DWORD(&dj.fs->win[i]);
S        }
S    }
S
S    LEAVE_FF(dj.fs, res);
S}
S
S
S
S#if !_FS_READONLY
S/*-----------------------------------------------------------------------*/
S/* Set volume label                                                      */
S/*-----------------------------------------------------------------------*/
S
SFRESULT f_setlabel (
S    const TCHAR* label  /* Pointer to the volume label to set */
S)
S{
S    FRESULT res;
S    DIR dj;
S    BYTE vn[11];
S    UINT i, j, sl;
S    WCHAR w;
S    DWORD tm;
S
S
S    /* Get logical drive */
S    res = chk_mounted(&label, &dj.fs, 1);
S    if (res) LEAVE_FF(dj.fs, res);
S
S    /* Create a volume label in directory form */
S    vn[0] = 0;
S    for (sl = 0; label[sl]; sl++) ;             /* Get name length */
S    for ( ; sl && label[sl-1] == ' '; sl--) ;   /* Remove trailing spaces */
S    if (sl) {   /* Create volume label in directory form */
S        i = j = 0;
S        do {
S#if _LFN_UNICODE
S            w = ff_convert(ff_wtoupper(label[i++]), 0);
S#else
S            w = (BYTE)label[i++];
S            if (IsDBCS1(w))
S                w = (j < 10 && i < sl && IsDBCS2(label[i])) ? (w << 8) | (BYTE)label[i++] : 0;
S#if _USE_LFN
S            w = ff_convert(ff_wtoupper(ff_convert(w, 1)), 0);
S#else
S            if (IsLower(w)) w -= 0x20;          /* To upper ASCII chars */
S#ifdef _EXCVT
S            if (w >= 0x80) w = ExCvt[w - 0x80]; /* To upper extended chars (SBCS cfg) */
S#else
S            if (!_DF1S && w >= 0x80) w = 0;     /* Reject extended chars (ASCII cfg) */
S#endif
S#endif
S#endif
S            if (!w || chk_chr("\"*+,.:;<=>\?[]|\x7F", w) || j >= (UINT)((w >= 0x100) ? 10 : 11)) /* Reject invalid chars for volume label */
S                LEAVE_FF(dj.fs, FR_INVALID_NAME);
S            if (w >= 0x100) vn[j++] = (BYTE)(w >> 8);
S            vn[j++] = (BYTE)w;
S        } while (i < sl);
S        while (j < 11) vn[j++] = ' ';
S    }
S
S    /* Set volume label */
S    dj.sclust = 0;                  /* Open root dir */
S    res = dir_sdi(&dj, 0);
S    if (res == FR_OK) {
S        res = dir_read(&dj, 1);     /* Get an entry with AM_VOL */
S        if (res == FR_OK) {         /* A volume label is found */
S            if (vn[0]) {
S                mem_cpy(dj.dir, vn, 11);    /* Change the volume label name */
S                tm = get_fattime();
S                ST_DWORD(dj.dir+DIR_WrtTime, tm);
S            } else {
S                dj.dir[0] = DDE;            /* Remove the volume label */
S            }
S            dj.fs->wflag = 1;
S            res = sync_fs(dj.fs);
S        } else {                    /* No volume label is found or error */
S            if (res == FR_NO_FILE) {
S                res = FR_OK;
S                if (vn[0]) {                /* Create volume label as new */
S                    res = dir_alloc(&dj, 1);    /* Allocate an entry for volume label */
S                    if (res == FR_OK) {
S                        mem_set(dj.dir, 0, SZ_DIR); /* Set volume label */
S                        mem_cpy(dj.dir, vn, 11);
S                        dj.dir[DIR_Attr] = AM_VOL;
S                        tm = get_fattime();
S                        ST_DWORD(dj.dir+DIR_WrtTime, tm);
S                        dj.fs->wflag = 1;
S                        res = sync_fs(dj.fs);
S                    }
S                }
S            }
S        }
S    }
S
S    LEAVE_FF(dj.fs, res);
S}
S
S#endif /* !_FS_READONLY */
N#endif /* _USE_LABEL */
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Forward data to the stream directly (available on only tiny cfg)      */
N/*-----------------------------------------------------------------------*/
N#if _USE_FORWARD && _FS_TINY
X#if 0 && 0
S
SFRESULT f_forward (
S    FIL *fp,                        /* Pointer to the file object */
S    UINT (*func)(const BYTE*,UINT), /* Pointer to the streaming function */
S    UINT btf,                       /* Number of bytes to forward */
S    UINT *bf                        /* Pointer to number of bytes forwarded */
S)
S{
S    FRESULT res;
S    DWORD remain, clst, sect;
S    UINT rcnt;
S    BYTE csect;
S
S
S    *bf = 0;    /* Clear transfer byte counter */
S
S    res = validate(fp);                             /* Check validity of the object */
S    if (res != FR_OK) LEAVE_FF(fp->fs, res);
S    if (fp->flag & FA__ERROR)                       /* Check error flag */
S        LEAVE_FF(fp->fs, FR_INT_ERR);
S    if (!(fp->flag & FA_READ))                      /* Check access mode */
S        LEAVE_FF(fp->fs, FR_DENIED);
S
S    remain = fp->fsize - fp->fptr;
S    if (btf > remain) btf = (UINT)remain;           /* Truncate btf by remaining bytes */
S
S    for ( ;  btf && (*func)(0, 0);                  /* Repeat until all data transferred or stream becomes busy */
S        fp->fptr += rcnt, *bf += rcnt, btf -= rcnt) {
S        csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));    /* Sector offset in the cluster */
S        if ((fp->fptr % SS(fp->fs)) == 0) {         /* On the sector boundary? */
S            if (!csect) {                           /* On the cluster boundary? */
S                clst = (fp->fptr == 0) ?            /* On the top of the file? */
S                    fp->sclust : get_fat(fp->fs, fp->clust);
S                if (clst <= 1) ABORT(fp->fs, FR_INT_ERR);
S                if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
S                fp->clust = clst;                   /* Update current cluster */
S            }
S        }
S        sect = clust2sect(fp->fs, fp->clust);       /* Get current data sector */
S        if (!sect) ABORT(fp->fs, FR_INT_ERR);
S        sect += csect;
S        if (move_window(fp->fs, sect))              /* Move sector window */
S            ABORT(fp->fs, FR_DISK_ERR);
S        fp->dsect = sect;
S        rcnt = SS(fp->fs) - (WORD)(fp->fptr % SS(fp->fs));  /* Forward data from sector window */
S        if (rcnt > btf) rcnt = btf;
S        rcnt = (*func)(&fp->fs->win[(WORD)fp->fptr % SS(fp->fs)], rcnt);
S        if (!rcnt) ABORT(fp->fs, FR_INT_ERR);
S    }
S
S    LEAVE_FF(fp->fs, FR_OK);
S}
N#endif /* _USE_FORWARD */
N
N
N
N#if _USE_MKFS && !_FS_READONLY
X#if 0 && !0
S/*-----------------------------------------------------------------------*/
S/* Create File System on the Drive                                       */
S/*-----------------------------------------------------------------------*/
S#define N_ROOTDIR   512     /* Number of root dir entries for FAT12/16 */
S#define N_FATS      1       /* Number of FAT copies (1 or 2) */
S
S
SFRESULT f_mkfs (
S    BYTE vol,       /* Logical drive number */
S    BYTE sfd,       /* Partitioning rule 0:FDISK, 1:SFD */
S    UINT au         /* Allocation unit size [bytes] */
S)
S{
S    static const WORD vst[] = { 1024,   512,  256,  128,   64,    32,   16,    8,    4,    2,   0};
S    static const WORD cst[] = {32768, 16384, 8192, 4096, 2048, 16384, 8192, 4096, 2048, 1024, 512};
S    BYTE fmt, md, sys, *tbl, pdrv, part;
S    DWORD n_clst, vs, n, wsect;
S    UINT i;
S    DWORD b_vol, b_fat, b_dir, b_data;  /* LBA */
S    DWORD n_vol, n_rsv, n_fat, n_dir;   /* Size */
S    FATFS *fs;
S    DSTATUS stat;
S
S
S    /* Check mounted drive and clear work area */
S    if (vol >= _VOLUMES) return FR_INVALID_DRIVE;
S    if (sfd > 1) return FR_INVALID_PARAMETER;
S    if (au & (au - 1)) return FR_INVALID_PARAMETER;
S    fs = FatFs[vol];
S    if (!fs) return FR_NOT_ENABLED;
S    fs->fs_type = 0;
S    pdrv = LD2PD(vol);  /* Physical drive */
S    part = LD2PT(vol);  /* Partition (0:auto detect, 1-4:get from partition table)*/
S
S    /* Get disk statics */
S    stat = disk_initialize(pdrv);
S    if (stat & STA_NOINIT) return FR_NOT_READY;
S    if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
S#if _MAX_SS != 512                  /* Get disk sector size */
S    if (disk_ioctl(pdrv, GET_SECTOR_SIZE, &SS(fs)) != RES_OK || SS(fs) > _MAX_SS)
S        return FR_DISK_ERR;
S#endif
S    if (_MULTI_PARTITION && part) {
S        /* Get partition information from partition table in the MBR */
S        if (disk_read(pdrv, fs->win, 0, 1) != RES_OK) return FR_DISK_ERR;
S        if (LD_WORD(fs->win+BS_55AA) != 0xAA55) return FR_MKFS_ABORTED;
S        tbl = &fs->win[MBR_Table + (part - 1) * SZ_PTE];
S        if (!tbl[4]) return FR_MKFS_ABORTED;    /* No partition? */
S        b_vol = LD_DWORD(tbl+8);    /* Volume start sector */
S        n_vol = LD_DWORD(tbl+12);   /* Volume size */
S    } else {
S        /* Create a partition in this function */
S        if (disk_ioctl(pdrv, GET_SECTOR_COUNT, &n_vol) != RES_OK || n_vol < 128)
S            return FR_DISK_ERR;
S        b_vol = (sfd) ? 0 : 63;     /* Volume start sector */
S        n_vol -= b_vol;             /* Volume size */
S    }
S
S    if (!au) {              /* AU auto selection */
S        vs = n_vol / (2000 / (SS(fs) / 512));
S        for (i = 0; vs < vst[i]; i++) ;
S        au = cst[i];
S    }
S    au /= SS(fs);       /* Number of sectors per cluster */
S    if (au == 0) au = 1;
S    if (au > 128) au = 128;
S
S    /* Pre-compute number of clusters and FAT sub-type */
S    n_clst = n_vol / au;
S    fmt = FS_FAT12;
S    if (n_clst >= MIN_FAT16) fmt = FS_FAT16;
S    if (n_clst >= MIN_FAT32) fmt = FS_FAT32;
S
S    /* Determine offset and size of FAT structure */
S    if (fmt == FS_FAT32) {
S        n_fat = ((n_clst * 4) + 8 + SS(fs) - 1) / SS(fs);
S        n_rsv = 32;
S        n_dir = 0;
S    } else {
S        n_fat = (fmt == FS_FAT12) ? (n_clst * 3 + 1) / 2 + 3 : (n_clst * 2) + 4;
S        n_fat = (n_fat + SS(fs) - 1) / SS(fs);
S        n_rsv = 1;
S        n_dir = (DWORD)N_ROOTDIR * SZ_DIR / SS(fs);
S    }
S    b_fat = b_vol + n_rsv;              /* FAT area start sector */
S    b_dir = b_fat + n_fat * N_FATS;     /* Directory area start sector */
S    b_data = b_dir + n_dir;             /* Data area start sector */
S    if (n_vol < b_data + au - b_vol) return FR_MKFS_ABORTED;    /* Too small volume */
S
S    /* Align data start sector to erase block boundary (for flash memory media) */
S    if (disk_ioctl(pdrv, GET_BLOCK_SIZE, &n) != RES_OK || !n || n > 32768) n = 1;
S    n = (b_data + n - 1) & ~(n - 1);    /* Next nearest erase block from current data start */
S    n = (n - b_data) / N_FATS;
S    if (fmt == FS_FAT32) {      /* FAT32: Move FAT offset */
S        n_rsv += n;
S        b_fat += n;
S    } else {                    /* FAT12/16: Expand FAT size */
S        n_fat += n;
S    }
S
S    /* Determine number of clusters and final check of validity of the FAT sub-type */
S    n_clst = (n_vol - n_rsv - n_fat * N_FATS - n_dir) / au;
S    if (   (fmt == FS_FAT16 && n_clst < MIN_FAT16)
S        || (fmt == FS_FAT32 && n_clst < MIN_FAT32))
S        return FR_MKFS_ABORTED;
S
S    switch (fmt) {  /* Determine system ID for partition table */
S    case FS_FAT12:  sys = 0x01; break;
S    case FS_FAT16:  sys = (n_vol < 0x10000) ? 0x04 : 0x06; break;
S    default:        sys = 0x0C;
S    }
S
S    if (_MULTI_PARTITION && part) {
S        /* Update system ID in the partition table */
S        tbl = &fs->win[MBR_Table + (part - 1) * SZ_PTE];
S        tbl[4] = sys;
S        if (disk_write(pdrv, fs->win, 0, 1) != RES_OK) return FR_DISK_ERR;
S        md = 0xF8;
S    } else {
S        if (sfd) {  /* No partition table (SFD) */
S            md = 0xF0;
S        } else {    /* Create partition table (FDISK) */
S            mem_set(fs->win, 0, SS(fs));
S            tbl = fs->win+MBR_Table;    /* Create partition table for single partition in the drive */
S            tbl[1] = 1;                     /* Partition start head */
S            tbl[2] = 1;                     /* Partition start sector */
S            tbl[3] = 0;                     /* Partition start cylinder */
S            tbl[4] = sys;                   /* System type */
S            tbl[5] = 254;                   /* Partition end head */
S            n = (b_vol + n_vol) / 63 / 255;
S            tbl[6] = (BYTE)((n >> 2) | 63); /* Partition end sector */
S            tbl[7] = (BYTE)n;               /* End cylinder */
S            ST_DWORD(tbl+8, 63);            /* Partition start in LBA */
S            ST_DWORD(tbl+12, n_vol);        /* Partition size in LBA */
S            ST_WORD(fs->win+BS_55AA, 0xAA55);   /* MBR signature */
S            if (disk_write(pdrv, fs->win, 0, 1) != RES_OK)  /* Write it to the MBR sector */
S                return FR_DISK_ERR;
S            md = 0xF8;
S        }
S    }
S
S    /* Create BPB in the VBR */
S    tbl = fs->win;                          /* Clear sector */
S    mem_set(tbl, 0, SS(fs));
S    mem_cpy(tbl, "\xEB\xFE\x90" "MSDOS5.0", 11);/* Boot jump code, OEM name */
S    i = SS(fs);                             /* Sector size */
S    ST_WORD(tbl+BPB_BytsPerSec, i);
S    tbl[BPB_SecPerClus] = (BYTE)au;         /* Sectors per cluster */
S    ST_WORD(tbl+BPB_RsvdSecCnt, n_rsv);     /* Reserved sectors */
S    tbl[BPB_NumFATs] = N_FATS;              /* Number of FATs */
S    i = (fmt == FS_FAT32) ? 0 : N_ROOTDIR;  /* Number of rootdir entries */
S    ST_WORD(tbl+BPB_RootEntCnt, i);
S    if (n_vol < 0x10000) {                  /* Number of total sectors */
S        ST_WORD(tbl+BPB_TotSec16, n_vol);
S    } else {
S        ST_DWORD(tbl+BPB_TotSec32, n_vol);
S    }
S    tbl[BPB_Media] = md;                    /* Media descriptor */
S    ST_WORD(tbl+BPB_SecPerTrk, 63);         /* Number of sectors per track */
S    ST_WORD(tbl+BPB_NumHeads, 255);         /* Number of heads */
S    ST_DWORD(tbl+BPB_HiddSec, b_vol);       /* Hidden sectors */
S    n = get_fattime();                      /* Use current time as VSN */
S    if (fmt == FS_FAT32) {
S        ST_DWORD(tbl+BS_VolID32, n);        /* VSN */
S        ST_DWORD(tbl+BPB_FATSz32, n_fat);   /* Number of sectors per FAT */
S        ST_DWORD(tbl+BPB_RootClus, 2);      /* Root directory start cluster (2) */
S        ST_WORD(tbl+BPB_FSInfo, 1);         /* FSInfo record offset (VBR+1) */
S        ST_WORD(tbl+BPB_BkBootSec, 6);      /* Backup boot record offset (VBR+6) */
S        tbl[BS_DrvNum32] = 0x80;            /* Drive number */
S        tbl[BS_BootSig32] = 0x29;           /* Extended boot signature */
S        mem_cpy(tbl+BS_VolLab32, "NO NAME    " "FAT32   ", 19); /* Volume label, FAT signature */
S    } else {
S        ST_DWORD(tbl+BS_VolID, n);          /* VSN */
S        ST_WORD(tbl+BPB_FATSz16, n_fat);    /* Number of sectors per FAT */
S        tbl[BS_DrvNum] = 0x80;              /* Drive number */
S        tbl[BS_BootSig] = 0x29;             /* Extended boot signature */
S        mem_cpy(tbl+BS_VolLab, "NO NAME    " "FAT     ", 19);   /* Volume label, FAT signature */
S    }
S    ST_WORD(tbl+BS_55AA, 0xAA55);           /* Signature (Offset is fixed here regardless of sector size) */
S    if (disk_write(pdrv, tbl, b_vol, 1) != RES_OK)  /* Write it to the VBR sector */
S        return FR_DISK_ERR;
S    if (fmt == FS_FAT32)                            /* Write backup VBR if needed (VBR+6) */
S        disk_write(pdrv, tbl, b_vol + 6, 1);
S
S    /* Initialize FAT area */
S    wsect = b_fat;
S    for (i = 0; i < N_FATS; i++) {      /* Initialize each FAT copy */
S        mem_set(tbl, 0, SS(fs));            /* 1st sector of the FAT  */
S        n = md;                             /* Media descriptor byte */
S        if (fmt != FS_FAT32) {
S            n |= (fmt == FS_FAT12) ? 0x00FFFF00 : 0xFFFFFF00;
S            ST_DWORD(tbl+0, n);             /* Reserve cluster #0-1 (FAT12/16) */
S        } else {
S            n |= 0xFFFFFF00;
S            ST_DWORD(tbl+0, n);             /* Reserve cluster #0-1 (FAT32) */
S            ST_DWORD(tbl+4, 0xFFFFFFFF);
S            ST_DWORD(tbl+8, 0x0FFFFFFF);    /* Reserve cluster #2 for root dir */
S        }
S        if (disk_write(pdrv, tbl, wsect++, 1) != RES_OK)
S            return FR_DISK_ERR;
S        mem_set(tbl, 0, SS(fs));            /* Fill following FAT entries with zero */
S        for (n = 1; n < n_fat; n++) {       /* This loop may take a time on FAT32 volume due to many single sector writes */
S            if (disk_write(pdrv, tbl, wsect++, 1) != RES_OK)
S                return FR_DISK_ERR;
S        }
S    }
S
S    /* Initialize root directory */
S    i = (fmt == FS_FAT32) ? au : n_dir;
S    do {
S        if (disk_write(pdrv, tbl, wsect++, 1) != RES_OK)
S            return FR_DISK_ERR;
S    } while (--i);
S
S#if _USE_ERASE  /* Erase data area if needed */
S    {
S        DWORD eb[2];
S
S        eb[0] = wsect; eb[1] = wsect + (n_clst - ((fmt == FS_FAT32) ? 1 : 0)) * au - 1;
S        disk_ioctl(pdrv, CTRL_ERASE_SECTOR, eb);
S    }
S#endif
S
S    /* Create FSInfo if needed */
S    if (fmt == FS_FAT32) {
S        ST_DWORD(tbl+FSI_LeadSig, 0x41615252);
S        ST_DWORD(tbl+FSI_StrucSig, 0x61417272);
S        ST_DWORD(tbl+FSI_Free_Count, n_clst - 1);   /* Number of free clusters */
S        ST_DWORD(tbl+FSI_Nxt_Free, 2);              /* Last allocated cluster# */
S        ST_WORD(tbl+BS_55AA, 0xAA55);
S        disk_write(pdrv, tbl, b_vol + 1, 1);    /* Write original (VBR+1) */
S        disk_write(pdrv, tbl, b_vol + 7, 1);    /* Write backup (VBR+7) */
S    }
S
S    return (disk_ioctl(pdrv, CTRL_SYNC, 0) == RES_OK) ? FR_OK : FR_DISK_ERR;
S}
S
S
S#if _MULTI_PARTITION
S/*-----------------------------------------------------------------------*/
S/* Divide Physical Drive                                                 */
S/*-----------------------------------------------------------------------*/
S
SFRESULT f_fdisk (
S    BYTE pdrv,          /* Physical drive number */
S    const DWORD szt[],  /* Pointer to the size table for each partitions */
S    void* work          /* Pointer to the working buffer */
S)
S{
S    UINT i, n, sz_cyl, tot_cyl, b_cyl, e_cyl, p_cyl;
S    BYTE s_hd, e_hd, *p, *buf = (BYTE*)work;
S    DSTATUS stat;
S    DWORD sz_disk, sz_part, s_part;
S
S
S    stat = disk_initialize(pdrv);
S    if (stat & STA_NOINIT) return FR_NOT_READY;
S    if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
S    if (disk_ioctl(pdrv, GET_SECTOR_COUNT, &sz_disk)) return FR_DISK_ERR;
S
S    /* Determine CHS in the table regardless of the drive geometry */
S    for (n = 16; n < 256 && sz_disk / n / 63 > 1024; n *= 2) ;
S    if (n == 256) n--;
S    e_hd = n - 1;
S    sz_cyl = 63 * n;
S    tot_cyl = sz_disk / sz_cyl;
S
S    /* Create partition table */
S    mem_set(buf, 0, _MAX_SS);
S    p = buf + MBR_Table; b_cyl = 0;
S    for (i = 0; i < 4; i++, p += SZ_PTE) {
S        p_cyl = (szt[i] <= 100) ? (DWORD)tot_cyl * szt[i] / 100 : szt[i] / sz_cyl;
S        if (!p_cyl) continue;
S        s_part = (DWORD)sz_cyl * b_cyl;
S        sz_part = (DWORD)sz_cyl * p_cyl;
S        if (i == 0) {   /* Exclude first track of cylinder 0 */
S            s_hd = 1;
S            s_part += 63; sz_part -= 63;
S        } else {
S            s_hd = 0;
S        }
S        e_cyl = b_cyl + p_cyl - 1;
S        if (e_cyl >= tot_cyl) return FR_INVALID_PARAMETER;
S
S        /* Set partition table */
S        p[1] = s_hd;                        /* Start head */
S        p[2] = (BYTE)((b_cyl >> 2) + 1);    /* Start sector */
S        p[3] = (BYTE)b_cyl;                 /* Start cylinder */
S        p[4] = 0x06;                        /* System type (temporary setting) */
S        p[5] = e_hd;                        /* End head */
S        p[6] = (BYTE)((e_cyl >> 2) + 63);   /* End sector */
S        p[7] = (BYTE)e_cyl;                 /* End cylinder */
S        ST_DWORD(p + 8, s_part);            /* Start sector in LBA */
S        ST_DWORD(p + 12, sz_part);          /* Partition size */
S
S        /* Next partition */
S        b_cyl += p_cyl;
S    }
S    ST_WORD(p, 0xAA55);
S
S    /* Write it to the MBR */
S    return (disk_write(pdrv, buf, 0, 1) || disk_ioctl(pdrv, CTRL_SYNC, 0)) ? FR_DISK_ERR : FR_OK;
S}
S
S
S#endif /* _MULTI_PARTITION */
N#endif /* _USE_MKFS && !_FS_READONLY */
N
N
N
N
N#if _USE_STRFUNC
X#if 1
N/*-----------------------------------------------------------------------*/
N/* Get a string from the file                                            */
N/*-----------------------------------------------------------------------*/
N
NTCHAR* f_gets (
N    TCHAR* buff,    /* Pointer to the string buffer to read */
N    int len,        /* Size of string buffer (characters) */
N    FIL* fp         /* Pointer to the file object */
N)
N{
N    int n = 0;
N    TCHAR c, *p = buff;
N    BYTE s[2];
N    UINT rc;
N
N
N    while (n < len - 1) {           /* Read bytes until buffer gets filled */
N        f_read(fp, s, 1, &rc);
N        if (rc != 1) break;         /* Break on EOF or error */
N        c = s[0];
N#if _LFN_UNICODE                    /* Read a character in UTF-8 encoding */
X#if 0                     
S        if (c >= 0x80) {
S            if (c < 0xC0) continue; /* Skip stray trailer */
S            if (c < 0xE0) {         /* Two-byte sequence */
S                f_read(fp, s, 1, &rc);
S                if (rc != 1) break;
S                c = ((c & 0x1F) << 6) | (s[0] & 0x3F);
S                if (c < 0x80) c = '?';
S            } else {
S                if (c < 0xF0) {     /* Three-byte sequence */
S                    f_read(fp, s, 2, &rc);
S                    if (rc != 2) break;
S                    c = (c << 12) | ((s[0] & 0x3F) << 6) | (s[1] & 0x3F);
S                    if (c < 0x800) c = '?';
S                } else {            /* Reject four-byte sequence */
S                    c = '?';
S                }
S            }
S        }
N#endif
N#if _USE_STRFUNC >= 2
X#if 1 >= 2
S        if (c == '\r') continue;    /* Strip '\r' */
N#endif
N        *p++ = c;
N        n++;
N        if (c == '\n') break;       /* Break on EOL */
N    }
N    *p = 0;
N    return n ? buff : 0;            /* When no data read (eof or error), return with error. */
N}
N
N
N
N#if !_FS_READONLY
X#if !0
N#include <stdarg.h>
L 1 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/stdarg.h" 1
N/*****************************************************************************/
N/* stdarg.h   v5.2.6                                                         */
N/*                                                                           */
N/* Copyright (c) 1996-2015 Texas Instruments Incorporated                    */
N/* http://www.ti.com/                                                        */
N/*                                                                           */
N/*  Redistribution and  use in source  and binary forms, with  or without    */
N/*  modification,  are permitted provided  that the  following conditions    */
N/*  are met:                                                                 */
N/*                                                                           */
N/*     Redistributions  of source  code must  retain the  above copyright    */
N/*     notice, this list of conditions and the following disclaimer.         */
N/*                                                                           */
N/*     Redistributions in binary form  must reproduce the above copyright    */
N/*     notice, this  list of conditions  and the following  disclaimer in    */
N/*     the  documentation  and/or   other  materials  provided  with  the    */
N/*     distribution.                                                         */
N/*                                                                           */
N/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
N/*     of its  contributors may  be used to  endorse or  promote products    */
N/*     derived  from   this  software  without   specific  prior  written    */
N/*     permission.                                                           */
N/*                                                                           */
N/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
N/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
N/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
N/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
N/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
N/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
N/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
N/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
N/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
N/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
N/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
N/*                                                                           */
N/*****************************************************************************/
N
N#ifndef _STDARG
N#define _STDARG
N
N#pragma diag_push
N#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */
N#pragma CHECK_MISRA("-19.10") /* need types as macro arguments */
N
N#ifdef __cplusplus
S#define _NS_PREFIX std::
Snamespace std {
N#else
N#define _NS_PREFIX
N#endif /* __cplusplus */
N
N#ifdef __TI_EABI_SUPPORT__
Ntypedef struct __va_list {
N    void * __ap;
N} va_list;
N#else
Stypedef char *va_list;
N#endif
N
N#ifdef __cplusplus
S} /* namespace std */
N#endif
N
N#define _VA_RNDUP(sz) 	(((sz) + 3) & ~3)
N#define _VA_MASK(tp)     ((__ALIGNOF__(tp) == 8) ? 7 : 3)
N#define _VA_ALN(ap,tp)  (((int)(ap) + _VA_MASK(tp)) & ~(_VA_MASK(tp)))
N
N#ifdef __TI_EABI_SUPPORT__
N#define va_start(ap, parmN)						      \
N   ((ap).__ap = ((void *)((((int)__va_parmadr(parmN))&~3) +                   \
N		                              _VA_RNDUP(sizeof(parmN)))))
X#define va_start(ap, parmN)						         ((ap).__ap = ((void *)((((int)__va_parmadr(parmN))&~3) +                   		                              _VA_RNDUP(sizeof(parmN)))))
N#else
S#define va_start(ap, parmN)						      \
S   ((ap) = (__va_argref(parmN) 						      \
S	    ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 )	      \
S	    : (sizeof(parmN) < sizeof(int)) 				      \
S	      ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 & ~3)	      \
S	      : (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + sizeof(parmN))))
X#define va_start(ap, parmN)						         ((ap) = (__va_argref(parmN) 						      	    ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 )	      	    : (sizeof(parmN) < sizeof(int)) 				      	      ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 & ~3)	      	      : (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + sizeof(parmN))))
N#endif
N
N#ifdef __big_endian__
S#ifdef __TI_EABI_SUPPORT__
S#define va_arg(_ap, _type)					 	      \
S    (((_ap).__ap = (void*)(_VA_ALN((_ap).__ap, _type) +                       \
S			                         _VA_RNDUP(sizeof(_type)))),  \
S     (*(_type *)((int)(_ap).__ap -                                            \
S		   (__va_argcsu(_type) ? _VA_RNDUP(sizeof(_type))	      \
S		                       : (sizeof(_type))))))
X#define va_arg(_ap, _type)					 	          (((_ap).__ap = (void*)(_VA_ALN((_ap).__ap, _type) +                       			                         _VA_RNDUP(sizeof(_type)))),       (*(_type *)((int)(_ap).__ap -                                            		   (__va_argcsu(_type) ? _VA_RNDUP(sizeof(_type))	      		                       : (sizeof(_type))))))
S#else
S#define va_arg(_ap, _type)                                       	      \
S        (__va_argref(_type)                                		      \
S	 ? ((_ap += sizeof(_type*)),(**(_type**)(_ap-(sizeof(_type*)))))      \
S	 : ((_ap += _VA_RNDUP(sizeof(_type))),(*(_type*)(_ap-(sizeof(_type))))))
X#define va_arg(_ap, _type)                                       	              (__va_argref(_type)                                		      	 ? ((_ap += sizeof(_type*)),(**(_type**)(_ap-(sizeof(_type*)))))      	 : ((_ap += _VA_RNDUP(sizeof(_type))),(*(_type*)(_ap-(sizeof(_type))))))
S#endif
N#else
N#ifdef __TI_EABI_SUPPORT__
N#define va_arg(_ap, _type) 						      \
N   (((_ap).__ap = (void *)(_VA_ALN((_ap).__ap,_type) +                        \
N			   _VA_RNDUP(sizeof(_type)))),                        \
N	     (*(_type *) ((int)(_ap).__ap - _VA_RNDUP(sizeof(_type)))))
X#define va_arg(_ap, _type) 						         (((_ap).__ap = (void *)(_VA_ALN((_ap).__ap,_type) +                        			   _VA_RNDUP(sizeof(_type)))),                        	     (*(_type *) ((int)(_ap).__ap - _VA_RNDUP(sizeof(_type)))))
N#else
S#define va_arg(_ap, _type)                                       	      \
S        (__va_argref(_type)                         		              \
S	 ? ((_ap += sizeof(_type*)), (**(_type**)(_ap- sizeof(_type*))))      \
S	 : ((_ap += _VA_RNDUP(sizeof(_type))),				      \
S	     (*(_type*)(_ap- _VA_RNDUP(sizeof(_type))))))
X#define va_arg(_ap, _type)                                       	              (__va_argref(_type)                         		              	 ? ((_ap += sizeof(_type*)), (**(_type**)(_ap- sizeof(_type*))))      	 : ((_ap += _VA_RNDUP(sizeof(_type))),				      	     (*(_type*)(_ap- _VA_RNDUP(sizeof(_type))))))
N#endif
N#endif
N
N#define va_end(ap) ((void)0)
N
N#pragma diag_pop
N
N#endif /* _STDARG */
N
N#pragma diag_push
N
N/* using declarations must occur outside header guard to support including both
N   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
N/* this code is for C++ mode only and thus also not relevant for MISRA */
N#pragma CHECK_MISRA("-19.15")
N
N#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
X#if 0L && !0L
Susing std::va_list;
N#endif /* _CPP_STYLE_HEADER */
N
N#pragma diag_pop
L 4160 "../ff.c" 2
N/*-----------------------------------------------------------------------*/
N/* Put a character to the file                                           */
N/*-----------------------------------------------------------------------*/
N
Nint f_putc (
N    TCHAR c,    /* A character to be output */
N    FIL* fp     /* Pointer to the file object */
N)
N{
N    UINT bw, btw;
N    BYTE s[3];
N
N
N#if _USE_STRFUNC >= 2
X#if 1 >= 2
S    if (c == '\n') f_putc ('\r', fp);   /* LF -> CRLF conversion */
N#endif
N
N#if _LFN_UNICODE    /* Write the character in UTF-8 encoding */
X#if 0     
S    if (c < 0x80) {         /* 7-bit */
S        s[0] = (BYTE)c;
S        btw = 1;
S    } else {
S        if (c < 0x800) {    /* 11-bit */
S            s[0] = (BYTE)(0xC0 | (c >> 6));
S            s[1] = (BYTE)(0x80 | (c & 0x3F));
S            btw = 2;
S        } else {            /* 16-bit */
S            s[0] = (BYTE)(0xE0 | (c >> 12));
S            s[1] = (BYTE)(0x80 | ((c >> 6) & 0x3F));
S            s[2] = (BYTE)(0x80 | (c & 0x3F));
S            btw = 3;
S        }
S    }
N#else               /* Write the character without conversion */
N    s[0] = (BYTE)c;
N    btw = 1;
N#endif
N    f_write(fp, s, btw, &bw);       /* Write the char to the file */
N    return (bw == btw) ? 1 : EOF;   /* Return the result */
X    return (bw == btw) ? 1 : (-1);    
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Put a string to the file                                              */
N/*-----------------------------------------------------------------------*/
N
Nint f_puts (
N    const TCHAR* str,   /* Pointer to the string to be output */
N    FIL* fp             /* Pointer to the file object */
N)
N{
N    int n;
N
N
N    for (n = 0; *str; str++, n++) {
N        if (f_putc(*str, fp) == EOF) return EOF;
X        if (f_putc(*str, fp) == (-1)) return (-1);
N    }
N    return n;
N}
N
N
N
N
N/*-----------------------------------------------------------------------*/
N/* Put a formatted string to the file                                    */
N/*-----------------------------------------------------------------------*/
N
Nint f_printf (
N    FIL* fp,            /* Pointer to the file object */
N    const TCHAR* str,   /* Pointer to the format string */
N    ...                 /* Optional arguments... */
N)
N{
N    va_list arp;
N    BYTE f, r;
N    UINT i, j, w;
N    ULONG v;
N    TCHAR c, d, s[16], *p;
N    int res, chc, cc;
N
N
N    va_start(arp, str);
X    ((arp). __ap = ((void *)((((int)__va_parmadr(str))&~3) + (((sizeof(str)) + 3) & ~3))));
N
N    for (cc = res = 0; cc != EOF; res += cc) {
X    for (cc = res = 0; cc != (-1); res += cc) {
N        c = *str++;
N        if (c == 0) break;          /* End of string */
N        if (c != '%') {             /* Non escape character */
N            cc = f_putc(c, fp);
N            if (cc != EOF) cc = 1;
X            if (cc != (-1)) cc = 1;
N            continue;
N        }
N        w = f = 0;
N        c = *str++;
N        if (c == '0') {             /* Flag: '0' padding */
N            f = 1; c = *str++;
N        } else {
N            if (c == '-') {         /* Flag: left justified */
N                f = 2; c = *str++;
N            }
N        }
N        while (IsDigit(c)) {        /* Precision */
X        while ((((c)>= '0')&&((c)<= '9'))) {         
N            w = w * 10 + c - '0';
N            c = *str++;
N        }
N        if (c == 'l' || c == 'L') { /* Prefix: Size is long int */
N            f |= 4; c = *str++;
N        }
N        if (!c) break;
N        d = c;
N        if (IsLower(d)) d -= 0x20;
X        if ((((d)>= 'a')&&((d)<= 'z'))) d -= 0x20;
N        switch (d) {                /* Type is... */
N        case 'S' :                  /* String */
N            p = va_arg(arp, TCHAR*);
X            p = (((arp). __ap = (void *)((((int)((arp). __ap) + ((__ALIGNOF__(TCHAR*) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(TCHAR*) == 8) ? 7 : 3))) + (((sizeof(TCHAR*)) + 3) & ~3))), (*(TCHAR* *) ((int)(arp). __ap - (((sizeof(TCHAR*)) + 3) & ~3))));
N            for (j = 0; p[j]; j++) ;
N            chc = 0;
N            if (!(f & 2)) {
N                while (j++ < w) chc += (cc = f_putc(' ', fp));
N            }
N            chc += (cc = f_puts(p, fp));
N            while (j++ < w) chc += (cc = f_putc(' ', fp));
N            if (cc != EOF) cc = chc;
X            if (cc != (-1)) cc = chc;
N            continue;
N        case 'C' :                  /* Character */
N            cc = f_putc((TCHAR)va_arg(arp, int), fp); continue;
X            cc = f_putc((TCHAR)(((arp). __ap = (void *)((((int)((arp). __ap) + ((__ALIGNOF__(int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(int) == 8) ? 7 : 3))) + (((sizeof(int)) + 3) & ~3))), (*(int *) ((int)(arp). __ap - (((sizeof(int)) + 3) & ~3)))), fp); continue;
N        case 'B' :                  /* Binary */
N            r = 2; break;
N        case 'O' :                  /* Octal */
N            r = 8; break;
N        case 'D' :                  /* Signed decimal */
N        case 'U' :                  /* Unsigned decimal */
N            r = 10; break;
N        case 'X' :                  /* Hexdecimal */
N            r = 16; break;
N        default:                    /* Unknown type (pass-through) */
N            cc = f_putc(c, fp); continue;
N        }
N
N        /* Get an argument and put it in numeral */
N        v = (f & 4) ? (ULONG)va_arg(arp, long) : ((d == 'D') ? (ULONG)(long)va_arg(arp, int) : (ULONG)va_arg(arp, unsigned int));
X        v = (f & 4) ? (ULONG)(((arp). __ap = (void *)((((int)((arp). __ap) + ((__ALIGNOF__(long) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(long) == 8) ? 7 : 3))) + (((sizeof(long)) + 3) & ~3))), (*(long *) ((int)(arp). __ap - (((sizeof(long)) + 3) & ~3)))) : ((d == 'D') ? (ULONG)(long)(((arp). __ap = (void *)((((int)((arp). __ap) + ((__ALIGNOF__(int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(int) == 8) ? 7 : 3))) + (((sizeof(int)) + 3) & ~3))), (*(int *) ((int)(arp). __ap - (((sizeof(int)) + 3) & ~3)))) : (ULONG)(((arp). __ap = (void *)((((int)((arp). __ap) + ((__ALIGNOF__(unsigned int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(unsigned int) == 8) ? 7 : 3))) + (((sizeof(unsigned int)) + 3) & ~3))), (*(unsigned int *) ((int)(arp). __ap - (((sizeof(unsigned int)) + 3) & ~3)))));
N        if (d == 'D' && (v & 0x80000000)) {
N            v = 0 - v;
N            f |= 8;
N        }
N        i = 0;
N        do {
N            d = (TCHAR)(v % r); v /= r;
N            if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
N            s[i++] = d + '0';
N        } while (v && i < sizeof s / sizeof s[0]);
N        if (f & 8) s[i++] = '-';
N        j = i; d = (f & 1) ? '0' : ' ';
N        chc = 0;
N        while (!(f & 2) && j++ < w) chc += (cc = f_putc(d, fp));
N        do chc += (cc = f_putc(s[--i], fp)); while(i);
N        while (j++ < w) chc += (cc = f_putc(' ', fp));
N        if (cc != EOF) cc = chc;
X        if (cc != (-1)) cc = chc;
N    }
N
N    va_end(arp);
X    ((void)0);
N    return (cc == EOF) ? cc : res;
X    return (cc == (-1)) ? cc : res;
R "../ff.c" 4267 15 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 4271 27 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 4275 13 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
R "../ff.c" 4303 15 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 4307 15 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 4308 26 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../ff.c" 4312 18 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N#endif /* !_FS_READONLY */
N#endif /* _USE_STRFUNC */
R "../ff.c" 476 6 (ULP 7.1) Detected use of global variable "Fsid" within one function "chk_mounted". Recommend placing variable in the function locally
