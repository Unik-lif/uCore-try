
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 28 0d 11 00       	mov    $0x110d28,%eax
  10000b:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100010:	89 44 24 08          	mov    %eax,0x8(%esp)
  100014:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001b:	00 
  10001c:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100023:	e8 de 32 00 00       	call   103306 <memset>

    cons_init();                // init the console
  100028:	e8 a4 15 00 00       	call   1015d1 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 a0 34 10 00 	movl   $0x1034a0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 bc 34 10 00 	movl   $0x1034bc,(%esp)
  100042:	e8 d9 02 00 00       	call   100320 <cprintf>

    print_kerninfo();
  100047:	e8 f7 07 00 00       	call   100843 <print_kerninfo>

    grade_backtrace();
  10004c:	e8 90 00 00 00       	call   1000e1 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 07 29 00 00       	call   10295d <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 d1 16 00 00       	call   10172c <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 58 18 00 00       	call   1018b8 <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 0d 0d 00 00       	call   100d72 <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 20 16 00 00       	call   10168a <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006a:	eb fe                	jmp    10006a <kern_init+0x6a>

0010006c <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006c:	55                   	push   %ebp
  10006d:	89 e5                	mov    %esp,%ebp
  10006f:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100072:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100079:	00 
  10007a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100081:	00 
  100082:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100089:	e8 ff 0b 00 00       	call   100c8d <mon_backtrace>
}
  10008e:	90                   	nop
  10008f:	89 ec                	mov    %ebp,%esp
  100091:	5d                   	pop    %ebp
  100092:	c3                   	ret    

00100093 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100093:	55                   	push   %ebp
  100094:	89 e5                	mov    %esp,%ebp
  100096:	83 ec 18             	sub    $0x18,%esp
  100099:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10009f:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a2:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000ac:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b4:	89 04 24             	mov    %eax,(%esp)
  1000b7:	e8 b0 ff ff ff       	call   10006c <grade_backtrace2>
}
  1000bc:	90                   	nop
  1000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000c0:	89 ec                	mov    %ebp,%esp
  1000c2:	5d                   	pop    %ebp
  1000c3:	c3                   	ret    

001000c4 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ca:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d4:	89 04 24             	mov    %eax,(%esp)
  1000d7:	e8 b7 ff ff ff       	call   100093 <grade_backtrace1>
}
  1000dc:	90                   	nop
  1000dd:	89 ec                	mov    %ebp,%esp
  1000df:	5d                   	pop    %ebp
  1000e0:	c3                   	ret    

001000e1 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e1:	55                   	push   %ebp
  1000e2:	89 e5                	mov    %esp,%ebp
  1000e4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e7:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ec:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f3:	ff 
  1000f4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000ff:	e8 c0 ff ff ff       	call   1000c4 <grade_backtrace0>
}
  100104:	90                   	nop
  100105:	89 ec                	mov    %ebp,%esp
  100107:	5d                   	pop    %ebp
  100108:	c3                   	ret    

00100109 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100109:	55                   	push   %ebp
  10010a:	89 e5                	mov    %esp,%ebp
  10010c:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010f:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100112:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100115:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100118:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	83 e0 03             	and    $0x3,%eax
  100122:	89 c2                	mov    %eax,%edx
  100124:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100129:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100131:	c7 04 24 c1 34 10 00 	movl   $0x1034c1,(%esp)
  100138:	e8 e3 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100141:	89 c2                	mov    %eax,%edx
  100143:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 cf 34 10 00 	movl   $0x1034cf,(%esp)
  100157:	e8 c4 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	89 c2                	mov    %eax,%edx
  100162:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100167:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016f:	c7 04 24 dd 34 10 00 	movl   $0x1034dd,(%esp)
  100176:	e8 a5 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017f:	89 c2                	mov    %eax,%edx
  100181:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100186:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018e:	c7 04 24 eb 34 10 00 	movl   $0x1034eb,(%esp)
  100195:	e8 86 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019a:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019e:	89 c2                	mov    %eax,%edx
  1001a0:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 f9 34 10 00 	movl   $0x1034f9,(%esp)
  1001b4:	e8 67 01 00 00       	call   100320 <cprintf>
    round ++;
  1001b9:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001be:	40                   	inc    %eax
  1001bf:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001c4:	90                   	nop
  1001c5:	89 ec                	mov    %ebp,%esp
  1001c7:	5d                   	pop    %ebp
  1001c8:	c3                   	ret    

001001c9 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c9:	55                   	push   %ebp
  1001ca:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001cc:	90                   	nop
  1001cd:	5d                   	pop    %ebp
  1001ce:	c3                   	ret    

001001cf <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cf:	55                   	push   %ebp
  1001d0:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001d2:	90                   	nop
  1001d3:	5d                   	pop    %ebp
  1001d4:	c3                   	ret    

001001d5 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d5:	55                   	push   %ebp
  1001d6:	89 e5                	mov    %esp,%ebp
  1001d8:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001db:	e8 29 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e0:	c7 04 24 08 35 10 00 	movl   $0x103508,(%esp)
  1001e7:	e8 34 01 00 00       	call   100320 <cprintf>
    lab1_switch_to_user();
  1001ec:	e8 d8 ff ff ff       	call   1001c9 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001f1:	e8 13 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f6:	c7 04 24 28 35 10 00 	movl   $0x103528,(%esp)
  1001fd:	e8 1e 01 00 00       	call   100320 <cprintf>
    lab1_switch_to_kernel();
  100202:	e8 c8 ff ff ff       	call   1001cf <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100207:	e8 fd fe ff ff       	call   100109 <lab1_print_cur_status>
}
  10020c:	90                   	nop
  10020d:	89 ec                	mov    %ebp,%esp
  10020f:	5d                   	pop    %ebp
  100210:	c3                   	ret    

00100211 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100211:	55                   	push   %ebp
  100212:	89 e5                	mov    %esp,%ebp
  100214:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100217:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10021b:	74 13                	je     100230 <readline+0x1f>
        cprintf("%s", prompt);
  10021d:	8b 45 08             	mov    0x8(%ebp),%eax
  100220:	89 44 24 04          	mov    %eax,0x4(%esp)
  100224:	c7 04 24 47 35 10 00 	movl   $0x103547,(%esp)
  10022b:	e8 f0 00 00 00       	call   100320 <cprintf>
    }
    int i = 0, c;
  100230:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100237:	e8 73 01 00 00       	call   1003af <getchar>
  10023c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10023f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100243:	79 07                	jns    10024c <readline+0x3b>
            return NULL;
  100245:	b8 00 00 00 00       	mov    $0x0,%eax
  10024a:	eb 78                	jmp    1002c4 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10024c:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100250:	7e 28                	jle    10027a <readline+0x69>
  100252:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100259:	7f 1f                	jg     10027a <readline+0x69>
            cputchar(c);
  10025b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10025e:	89 04 24             	mov    %eax,(%esp)
  100261:	e8 e2 00 00 00       	call   100348 <cputchar>
            buf[i ++] = c;
  100266:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100269:	8d 50 01             	lea    0x1(%eax),%edx
  10026c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10026f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100272:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  100278:	eb 45                	jmp    1002bf <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  10027a:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10027e:	75 16                	jne    100296 <readline+0x85>
  100280:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100284:	7e 10                	jle    100296 <readline+0x85>
            cputchar(c);
  100286:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100289:	89 04 24             	mov    %eax,(%esp)
  10028c:	e8 b7 00 00 00       	call   100348 <cputchar>
            i --;
  100291:	ff 4d f4             	decl   -0xc(%ebp)
  100294:	eb 29                	jmp    1002bf <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100296:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10029a:	74 06                	je     1002a2 <readline+0x91>
  10029c:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002a0:	75 95                	jne    100237 <readline+0x26>
            cputchar(c);
  1002a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002a5:	89 04 24             	mov    %eax,(%esp)
  1002a8:	e8 9b 00 00 00       	call   100348 <cputchar>
            buf[i] = '\0';
  1002ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002b0:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1002b5:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b8:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1002bd:	eb 05                	jmp    1002c4 <readline+0xb3>
        c = getchar();
  1002bf:	e9 73 ff ff ff       	jmp    100237 <readline+0x26>
        }
    }
}
  1002c4:	89 ec                	mov    %ebp,%esp
  1002c6:	5d                   	pop    %ebp
  1002c7:	c3                   	ret    

001002c8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d1:	89 04 24             	mov    %eax,(%esp)
  1002d4:	e8 27 13 00 00       	call   101600 <cons_putc>
    (*cnt) ++;
  1002d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002dc:	8b 00                	mov    (%eax),%eax
  1002de:	8d 50 01             	lea    0x1(%eax),%edx
  1002e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e4:	89 10                	mov    %edx,(%eax)
}
  1002e6:	90                   	nop
  1002e7:	89 ec                	mov    %ebp,%esp
  1002e9:	5d                   	pop    %ebp
  1002ea:	c3                   	ret    

001002eb <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002eb:	55                   	push   %ebp
  1002ec:	89 e5                	mov    %esp,%ebp
  1002ee:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002fb:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002ff:	8b 45 08             	mov    0x8(%ebp),%eax
  100302:	89 44 24 08          	mov    %eax,0x8(%esp)
  100306:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100309:	89 44 24 04          	mov    %eax,0x4(%esp)
  10030d:	c7 04 24 c8 02 10 00 	movl   $0x1002c8,(%esp)
  100314:	e8 18 28 00 00       	call   102b31 <vprintfmt>
    return cnt;
  100319:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10031c:	89 ec                	mov    %ebp,%esp
  10031e:	5d                   	pop    %ebp
  10031f:	c3                   	ret    

00100320 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100320:	55                   	push   %ebp
  100321:	89 e5                	mov    %esp,%ebp
  100323:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100326:	8d 45 0c             	lea    0xc(%ebp),%eax
  100329:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10032c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10032f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100333:	8b 45 08             	mov    0x8(%ebp),%eax
  100336:	89 04 24             	mov    %eax,(%esp)
  100339:	e8 ad ff ff ff       	call   1002eb <vcprintf>
  10033e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100341:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100344:	89 ec                	mov    %ebp,%esp
  100346:	5d                   	pop    %ebp
  100347:	c3                   	ret    

00100348 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100348:	55                   	push   %ebp
  100349:	89 e5                	mov    %esp,%ebp
  10034b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10034e:	8b 45 08             	mov    0x8(%ebp),%eax
  100351:	89 04 24             	mov    %eax,(%esp)
  100354:	e8 a7 12 00 00       	call   101600 <cons_putc>
}
  100359:	90                   	nop
  10035a:	89 ec                	mov    %ebp,%esp
  10035c:	5d                   	pop    %ebp
  10035d:	c3                   	ret    

0010035e <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10035e:	55                   	push   %ebp
  10035f:	89 e5                	mov    %esp,%ebp
  100361:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100364:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10036b:	eb 13                	jmp    100380 <cputs+0x22>
        cputch(c, &cnt);
  10036d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100371:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100374:	89 54 24 04          	mov    %edx,0x4(%esp)
  100378:	89 04 24             	mov    %eax,(%esp)
  10037b:	e8 48 ff ff ff       	call   1002c8 <cputch>
    while ((c = *str ++) != '\0') {
  100380:	8b 45 08             	mov    0x8(%ebp),%eax
  100383:	8d 50 01             	lea    0x1(%eax),%edx
  100386:	89 55 08             	mov    %edx,0x8(%ebp)
  100389:	0f b6 00             	movzbl (%eax),%eax
  10038c:	88 45 f7             	mov    %al,-0x9(%ebp)
  10038f:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100393:	75 d8                	jne    10036d <cputs+0xf>
    }
    cputch('\n', &cnt);
  100395:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100398:	89 44 24 04          	mov    %eax,0x4(%esp)
  10039c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1003a3:	e8 20 ff ff ff       	call   1002c8 <cputch>
    return cnt;
  1003a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003ab:	89 ec                	mov    %ebp,%esp
  1003ad:	5d                   	pop    %ebp
  1003ae:	c3                   	ret    

001003af <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003af:	55                   	push   %ebp
  1003b0:	89 e5                	mov    %esp,%ebp
  1003b2:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003b5:	90                   	nop
  1003b6:	e8 71 12 00 00       	call   10162c <cons_getc>
  1003bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003c2:	74 f2                	je     1003b6 <getchar+0x7>
        /* do nothing */;
    return c;
  1003c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003c7:	89 ec                	mov    %ebp,%esp
  1003c9:	5d                   	pop    %ebp
  1003ca:	c3                   	ret    

001003cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003cb:	55                   	push   %ebp
  1003cc:	89 e5                	mov    %esp,%ebp
  1003ce:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003d4:	8b 00                	mov    (%eax),%eax
  1003d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003d9:	8b 45 10             	mov    0x10(%ebp),%eax
  1003dc:	8b 00                	mov    (%eax),%eax
  1003de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003e8:	e9 ca 00 00 00       	jmp    1004b7 <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1003ed:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003f3:	01 d0                	add    %edx,%eax
  1003f5:	89 c2                	mov    %eax,%edx
  1003f7:	c1 ea 1f             	shr    $0x1f,%edx
  1003fa:	01 d0                	add    %edx,%eax
  1003fc:	d1 f8                	sar    %eax
  1003fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100401:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100404:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
		// when fail at the end, l will become bigger than r.
		// The logic here is simply to find the first m that suitable for our type.
        while (m >= l && stabs[m].n_type != type) {
  100407:	eb 03                	jmp    10040c <stab_binsearch+0x41>
            m --;
  100409:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  10040c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10040f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100412:	7c 1f                	jl     100433 <stab_binsearch+0x68>
  100414:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100417:	89 d0                	mov    %edx,%eax
  100419:	01 c0                	add    %eax,%eax
  10041b:	01 d0                	add    %edx,%eax
  10041d:	c1 e0 02             	shl    $0x2,%eax
  100420:	89 c2                	mov    %eax,%edx
  100422:	8b 45 08             	mov    0x8(%ebp),%eax
  100425:	01 d0                	add    %edx,%eax
  100427:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10042b:	0f b6 c0             	movzbl %al,%eax
  10042e:	39 45 14             	cmp    %eax,0x14(%ebp)
  100431:	75 d6                	jne    100409 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  100433:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100436:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100439:	7d 09                	jge    100444 <stab_binsearch+0x79>
            l = true_m + 1;
  10043b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10043e:	40                   	inc    %eax
  10043f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100442:	eb 73                	jmp    1004b7 <stab_binsearch+0xec>
        // For this while loop:
		// 1. We assure the m is of right type. -> that will be computed for region_left or region_right.
		// 2. We use binsearch to accelerate the speed to find m, we ensure at least one is smaller than addr,
		// one is bigger than addr, but not ensure this m is the closest to the addr. When we are using binsearch,
		// we implicitly omit some l and some r values. What we do here is simply found the right&left bounds. 
		any_matches = 1;
  100444:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10044b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10044e:	89 d0                	mov    %edx,%eax
  100450:	01 c0                	add    %eax,%eax
  100452:	01 d0                	add    %edx,%eax
  100454:	c1 e0 02             	shl    $0x2,%eax
  100457:	89 c2                	mov    %eax,%edx
  100459:	8b 45 08             	mov    0x8(%ebp),%eax
  10045c:	01 d0                	add    %edx,%eax
  10045e:	8b 40 08             	mov    0x8(%eax),%eax
  100461:	39 45 18             	cmp    %eax,0x18(%ebp)
  100464:	76 11                	jbe    100477 <stab_binsearch+0xac>
            *region_left = m;
  100466:	8b 45 0c             	mov    0xc(%ebp),%eax
  100469:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10046c:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10046e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100471:	40                   	inc    %eax
  100472:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100475:	eb 40                	jmp    1004b7 <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  100477:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10047a:	89 d0                	mov    %edx,%eax
  10047c:	01 c0                	add    %eax,%eax
  10047e:	01 d0                	add    %edx,%eax
  100480:	c1 e0 02             	shl    $0x2,%eax
  100483:	89 c2                	mov    %eax,%edx
  100485:	8b 45 08             	mov    0x8(%ebp),%eax
  100488:	01 d0                	add    %edx,%eax
  10048a:	8b 40 08             	mov    0x8(%eax),%eax
  10048d:	39 45 18             	cmp    %eax,0x18(%ebp)
  100490:	73 14                	jae    1004a6 <stab_binsearch+0xdb>
            *region_right = m - 1;
  100492:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100495:	8d 50 ff             	lea    -0x1(%eax),%edx
  100498:	8b 45 10             	mov    0x10(%ebp),%eax
  10049b:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	48                   	dec    %eax
  1004a1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a4:	eb 11                	jmp    1004b7 <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1004a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004ac:	89 10                	mov    %edx,(%eax)
            l = m;
  1004ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004b4:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1004b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004ba:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004bd:	0f 8e 2a ff ff ff    	jle    1003ed <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  1004c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004c7:	75 0f                	jne    1004d8 <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  1004c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004cc:	8b 00                	mov    (%eax),%eax
  1004ce:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004d1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d4:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1004d6:	eb 3e                	jmp    100516 <stab_binsearch+0x14b>
        l = *region_right;
  1004d8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004db:	8b 00                	mov    (%eax),%eax
  1004dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004e0:	eb 03                	jmp    1004e5 <stab_binsearch+0x11a>
  1004e2:	ff 4d fc             	decl   -0x4(%ebp)
  1004e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e8:	8b 00                	mov    (%eax),%eax
  1004ea:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1004ed:	7e 1f                	jle    10050e <stab_binsearch+0x143>
  1004ef:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f2:	89 d0                	mov    %edx,%eax
  1004f4:	01 c0                	add    %eax,%eax
  1004f6:	01 d0                	add    %edx,%eax
  1004f8:	c1 e0 02             	shl    $0x2,%eax
  1004fb:	89 c2                	mov    %eax,%edx
  1004fd:	8b 45 08             	mov    0x8(%ebp),%eax
  100500:	01 d0                	add    %edx,%eax
  100502:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100506:	0f b6 c0             	movzbl %al,%eax
  100509:	39 45 14             	cmp    %eax,0x14(%ebp)
  10050c:	75 d4                	jne    1004e2 <stab_binsearch+0x117>
        *region_left = l;
  10050e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100511:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100514:	89 10                	mov    %edx,(%eax)
}
  100516:	90                   	nop
  100517:	89 ec                	mov    %ebp,%esp
  100519:	5d                   	pop    %ebp
  10051a:	c3                   	ret    

0010051b <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10051b:	55                   	push   %ebp
  10051c:	89 e5                	mov    %esp,%ebp
  10051e:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100521:	8b 45 0c             	mov    0xc(%ebp),%eax
  100524:	c7 00 4c 35 10 00    	movl   $0x10354c,(%eax)
    info->eip_line = 0;
  10052a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100534:	8b 45 0c             	mov    0xc(%ebp),%eax
  100537:	c7 40 08 4c 35 10 00 	movl   $0x10354c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10053e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100541:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100548:	8b 45 0c             	mov    0xc(%ebp),%eax
  10054b:	8b 55 08             	mov    0x8(%ebp),%edx
  10054e:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100551:	8b 45 0c             	mov    0xc(%ebp),%eax
  100554:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10055b:	c7 45 f4 ec 3d 10 00 	movl   $0x103dec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100562:	c7 45 f0 f0 ba 10 00 	movl   $0x10baf0,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100569:	c7 45 ec f1 ba 10 00 	movl   $0x10baf1,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100570:	c7 45 e8 77 e4 10 00 	movl   $0x10e477,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100577:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10057a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10057d:	76 0b                	jbe    10058a <debuginfo_eip+0x6f>
  10057f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100582:	48                   	dec    %eax
  100583:	0f b6 00             	movzbl (%eax),%eax
  100586:	84 c0                	test   %al,%al
  100588:	74 0a                	je     100594 <debuginfo_eip+0x79>
        return -1;
  10058a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10058f:	e9 ab 02 00 00       	jmp    10083f <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100594:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10059b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10059e:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1005a1:	c1 f8 02             	sar    $0x2,%eax
  1005a4:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005aa:	48                   	dec    %eax
  1005ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005b5:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005bc:	00 
  1005bd:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005c0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005c4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005c7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005ce:	89 04 24             	mov    %eax,(%esp)
  1005d1:	e8 f5 fd ff ff       	call   1003cb <stab_binsearch>
    if (lfile == 0)
  1005d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005d9:	85 c0                	test   %eax,%eax
  1005db:	75 0a                	jne    1005e7 <debuginfo_eip+0xcc>
        return -1;
  1005dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005e2:	e9 58 02 00 00       	jmp    10083f <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
	// File -> Function -> Line.
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005ea:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f6:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005fa:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100601:	00 
  100602:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100605:	89 44 24 08          	mov    %eax,0x8(%esp)
  100609:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10060c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100610:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100613:	89 04 24             	mov    %eax,(%esp)
  100616:	e8 b0 fd ff ff       	call   1003cb <stab_binsearch>

    if (lfun <= rfun) {
  10061b:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10061e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100621:	39 c2                	cmp    %eax,%edx
  100623:	7f 78                	jg     10069d <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  100625:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100628:	89 c2                	mov    %eax,%edx
  10062a:	89 d0                	mov    %edx,%eax
  10062c:	01 c0                	add    %eax,%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	c1 e0 02             	shl    $0x2,%eax
  100633:	89 c2                	mov    %eax,%edx
  100635:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100638:	01 d0                	add    %edx,%eax
  10063a:	8b 10                	mov    (%eax),%edx
  10063c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063f:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100642:	39 c2                	cmp    %eax,%edx
  100644:	73 22                	jae    100668 <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx; // point to where the string stores.
  100646:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100649:	89 c2                	mov    %eax,%edx
  10064b:	89 d0                	mov    %edx,%eax
  10064d:	01 c0                	add    %eax,%eax
  10064f:	01 d0                	add    %edx,%eax
  100651:	c1 e0 02             	shl    $0x2,%eax
  100654:	89 c2                	mov    %eax,%edx
  100656:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100659:	01 d0                	add    %edx,%eax
  10065b:	8b 10                	mov    (%eax),%edx
  10065d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100660:	01 c2                	add    %eax,%edx
  100662:	8b 45 0c             	mov    0xc(%ebp),%eax
  100665:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value; // n_value is the value of the symbol. See objudmp -t, we can get this info.
  100668:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10066b:	89 c2                	mov    %eax,%edx
  10066d:	89 d0                	mov    %edx,%eax
  10066f:	01 c0                	add    %eax,%eax
  100671:	01 d0                	add    %edx,%eax
  100673:	c1 e0 02             	shl    $0x2,%eax
  100676:	89 c2                	mov    %eax,%edx
  100678:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10067b:	01 d0                	add    %edx,%eax
  10067d:	8b 50 08             	mov    0x8(%eax),%edx
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr; // ? I don't know why? -> check STABS S_LINE type you will know the reason. 
  100686:	8b 45 0c             	mov    0xc(%ebp),%eax
  100689:	8b 40 10             	mov    0x10(%eax),%eax
  10068c:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10068f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100692:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100695:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100698:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10069b:	eb 15                	jmp    1006b2 <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10069d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a0:	8b 55 08             	mov    0x8(%ebp),%edx
  1006a3:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006af:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b5:	8b 40 08             	mov    0x8(%eax),%eax
  1006b8:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006bf:	00 
  1006c0:	89 04 24             	mov    %eax,(%esp)
  1006c3:	e8 b6 2a 00 00       	call   10317e <strfind>
  1006c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006cb:	8b 4a 08             	mov    0x8(%edx),%ecx
  1006ce:	29 c8                	sub    %ecx,%eax
  1006d0:	89 c2                	mov    %eax,%edx
  1006d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006d5:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1006db:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006df:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e6:	00 
  1006e7:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006ea:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ee:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f8:	89 04 24             	mov    %eax,(%esp)
  1006fb:	e8 cb fc ff ff       	call   1003cb <stab_binsearch>
    if (lline <= rline) {
  100700:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100703:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100706:	39 c2                	cmp    %eax,%edx
  100708:	7f 23                	jg     10072d <debuginfo_eip+0x212>
        info->eip_line = stabs[rline].n_desc;
  10070a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10070d:	89 c2                	mov    %eax,%edx
  10070f:	89 d0                	mov    %edx,%eax
  100711:	01 c0                	add    %eax,%eax
  100713:	01 d0                	add    %edx,%eax
  100715:	c1 e0 02             	shl    $0x2,%eax
  100718:	89 c2                	mov    %eax,%edx
  10071a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071d:	01 d0                	add    %edx,%eax
  10071f:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100723:	89 c2                	mov    %eax,%edx
  100725:	8b 45 0c             	mov    0xc(%ebp),%eax
  100728:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10072b:	eb 11                	jmp    10073e <debuginfo_eip+0x223>
        return -1;
  10072d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100732:	e9 08 01 00 00       	jmp    10083f <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100737:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10073a:	48                   	dec    %eax
  10073b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  10073e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100741:	8b 45 e4             	mov    -0x1c(%ebp),%eax
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100744:	39 c2                	cmp    %eax,%edx
  100746:	7c 56                	jl     10079e <debuginfo_eip+0x283>
           && stabs[lline].n_type != N_SOL
  100748:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074b:	89 c2                	mov    %eax,%edx
  10074d:	89 d0                	mov    %edx,%eax
  10074f:	01 c0                	add    %eax,%eax
  100751:	01 d0                	add    %edx,%eax
  100753:	c1 e0 02             	shl    $0x2,%eax
  100756:	89 c2                	mov    %eax,%edx
  100758:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075b:	01 d0                	add    %edx,%eax
  10075d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100761:	3c 84                	cmp    $0x84,%al
  100763:	74 39                	je     10079e <debuginfo_eip+0x283>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100765:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100768:	89 c2                	mov    %eax,%edx
  10076a:	89 d0                	mov    %edx,%eax
  10076c:	01 c0                	add    %eax,%eax
  10076e:	01 d0                	add    %edx,%eax
  100770:	c1 e0 02             	shl    $0x2,%eax
  100773:	89 c2                	mov    %eax,%edx
  100775:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100778:	01 d0                	add    %edx,%eax
  10077a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077e:	3c 64                	cmp    $0x64,%al
  100780:	75 b5                	jne    100737 <debuginfo_eip+0x21c>
  100782:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100785:	89 c2                	mov    %eax,%edx
  100787:	89 d0                	mov    %edx,%eax
  100789:	01 c0                	add    %eax,%eax
  10078b:	01 d0                	add    %edx,%eax
  10078d:	c1 e0 02             	shl    $0x2,%eax
  100790:	89 c2                	mov    %eax,%edx
  100792:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100795:	01 d0                	add    %edx,%eax
  100797:	8b 40 08             	mov    0x8(%eax),%eax
  10079a:	85 c0                	test   %eax,%eax
  10079c:	74 99                	je     100737 <debuginfo_eip+0x21c>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a4:	39 c2                	cmp    %eax,%edx
  1007a6:	7c 42                	jl     1007ea <debuginfo_eip+0x2cf>
  1007a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ab:	89 c2                	mov    %eax,%edx
  1007ad:	89 d0                	mov    %edx,%eax
  1007af:	01 c0                	add    %eax,%eax
  1007b1:	01 d0                	add    %edx,%eax
  1007b3:	c1 e0 02             	shl    $0x2,%eax
  1007b6:	89 c2                	mov    %eax,%edx
  1007b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007bb:	01 d0                	add    %edx,%eax
  1007bd:	8b 10                	mov    (%eax),%edx
  1007bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007c2:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1007c5:	39 c2                	cmp    %eax,%edx
  1007c7:	73 21                	jae    1007ea <debuginfo_eip+0x2cf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cc:	89 c2                	mov    %eax,%edx
  1007ce:	89 d0                	mov    %edx,%eax
  1007d0:	01 c0                	add    %eax,%eax
  1007d2:	01 d0                	add    %edx,%eax
  1007d4:	c1 e0 02             	shl    $0x2,%eax
  1007d7:	89 c2                	mov    %eax,%edx
  1007d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dc:	01 d0                	add    %edx,%eax
  1007de:	8b 10                	mov    (%eax),%edx
  1007e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e3:	01 c2                	add    %eax,%edx
  1007e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e8:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007ea:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f0:	39 c2                	cmp    %eax,%edx
  1007f2:	7d 46                	jge    10083a <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  1007f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f7:	40                   	inc    %eax
  1007f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fb:	eb 16                	jmp    100813 <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100800:	8b 40 14             	mov    0x14(%eax),%eax
  100803:	8d 50 01             	lea    0x1(%eax),%edx
  100806:	8b 45 0c             	mov    0xc(%ebp),%eax
  100809:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  10080c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10080f:	40                   	inc    %eax
  100810:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100813:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100816:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100819:	39 c2                	cmp    %eax,%edx
  10081b:	7d 1d                	jge    10083a <debuginfo_eip+0x31f>
  10081d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100820:	89 c2                	mov    %eax,%edx
  100822:	89 d0                	mov    %edx,%eax
  100824:	01 c0                	add    %eax,%eax
  100826:	01 d0                	add    %edx,%eax
  100828:	c1 e0 02             	shl    $0x2,%eax
  10082b:	89 c2                	mov    %eax,%edx
  10082d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100830:	01 d0                	add    %edx,%eax
  100832:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100836:	3c a0                	cmp    $0xa0,%al
  100838:	74 c3                	je     1007fd <debuginfo_eip+0x2e2>
        }
    }
    return 0;
  10083a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10083f:	89 ec                	mov    %ebp,%esp
  100841:	5d                   	pop    %ebp
  100842:	c3                   	ret    

00100843 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100843:	55                   	push   %ebp
  100844:	89 e5                	mov    %esp,%ebp
  100846:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100849:	c7 04 24 56 35 10 00 	movl   $0x103556,(%esp)
  100850:	e8 cb fa ff ff       	call   100320 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100855:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085c:	00 
  10085d:	c7 04 24 6f 35 10 00 	movl   $0x10356f,(%esp)
  100864:	e8 b7 fa ff ff       	call   100320 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100869:	c7 44 24 04 92 34 10 	movl   $0x103492,0x4(%esp)
  100870:	00 
  100871:	c7 04 24 87 35 10 00 	movl   $0x103587,(%esp)
  100878:	e8 a3 fa ff ff       	call   100320 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10087d:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  100884:	00 
  100885:	c7 04 24 9f 35 10 00 	movl   $0x10359f,(%esp)
  10088c:	e8 8f fa ff ff       	call   100320 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100891:	c7 44 24 04 28 0d 11 	movl   $0x110d28,0x4(%esp)
  100898:	00 
  100899:	c7 04 24 b7 35 10 00 	movl   $0x1035b7,(%esp)
  1008a0:	e8 7b fa ff ff       	call   100320 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a5:	b8 28 0d 11 00       	mov    $0x110d28,%eax
  1008aa:	2d 00 00 10 00       	sub    $0x100000,%eax
  1008af:	05 ff 03 00 00       	add    $0x3ff,%eax
  1008b4:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008ba:	85 c0                	test   %eax,%eax
  1008bc:	0f 48 c2             	cmovs  %edx,%eax
  1008bf:	c1 f8 0a             	sar    $0xa,%eax
  1008c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008c6:	c7 04 24 d0 35 10 00 	movl   $0x1035d0,(%esp)
  1008cd:	e8 4e fa ff ff       	call   100320 <cprintf>
}
  1008d2:	90                   	nop
  1008d3:	89 ec                	mov    %ebp,%esp
  1008d5:	5d                   	pop    %ebp
  1008d6:	c3                   	ret    

001008d7 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008d7:	55                   	push   %ebp
  1008d8:	89 e5                	mov    %esp,%ebp
  1008da:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e0:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ea:	89 04 24             	mov    %eax,(%esp)
  1008ed:	e8 29 fc ff ff       	call   10051b <debuginfo_eip>
  1008f2:	85 c0                	test   %eax,%eax
  1008f4:	74 15                	je     10090b <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008fd:	c7 04 24 fa 35 10 00 	movl   $0x1035fa,(%esp)
  100904:	e8 17 fa ff ff       	call   100320 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100909:	eb 6c                	jmp    100977 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10090b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100912:	eb 1b                	jmp    10092f <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  100914:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100917:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091a:	01 d0                	add    %edx,%eax
  10091c:	0f b6 10             	movzbl (%eax),%edx
  10091f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100925:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100928:	01 c8                	add    %ecx,%eax
  10092a:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10092c:	ff 45 f4             	incl   -0xc(%ebp)
  10092f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100932:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100935:	7c dd                	jl     100914 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100937:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  10093d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100940:	01 d0                	add    %edx,%eax
  100942:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100945:	8b 55 ec             	mov    -0x14(%ebp),%edx
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100948:	8b 45 08             	mov    0x8(%ebp),%eax
  10094b:	29 d0                	sub    %edx,%eax
  10094d:	89 c1                	mov    %eax,%ecx
  10094f:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100952:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100955:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100959:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10095f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100963:	89 54 24 08          	mov    %edx,0x8(%esp)
  100967:	89 44 24 04          	mov    %eax,0x4(%esp)
  10096b:	c7 04 24 16 36 10 00 	movl   $0x103616,(%esp)
  100972:	e8 a9 f9 ff ff       	call   100320 <cprintf>
}
  100977:	90                   	nop
  100978:	89 ec                	mov    %ebp,%esp
  10097a:	5d                   	pop    %ebp
  10097b:	c3                   	ret    

0010097c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097c:	55                   	push   %ebp
  10097d:	89 e5                	mov    %esp,%ebp
  10097f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl %%ebp, %0" : "=r" (eip));
  100982:	89 e8                	mov    %ebp,%eax
  100984:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100987:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098a:	89 ec                	mov    %ebp,%esp
  10098c:	5d                   	pop    %ebp
  10098d:	c3                   	ret    

0010098e <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  10098e:	55                   	push   %ebp
  10098f:	89 e5                	mov    %esp,%ebp
  100991:	83 ec 48             	sub    $0x48,%esp
  100994:	89 5d fc             	mov    %ebx,-0x4(%ebp)
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	int time = 0;
  100997:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  10099e:	89 e8                	mov    %ebp,%eax
  1009a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  1009a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
	uint32_t ebp = read_ebp(); // | return address  | <-- caller's eip. read_ebp will simply return ebp value.
  1009a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
							   // - - - - - - - - - -
	uint32_t eip = read_eip(); // |   last  ebp     | <-- ebp point to this position. read_eip will load the memory 4(%%ebp).
  1009a9:	e8 ce ff ff ff       	call   10097c <read_eip>
  1009ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
	// BTW: the read_eip function here is very tricky!! Understand this thing is of great fun!	
	
	// End point: when ebp is equal to 0, then our stackframe chain ends.
	while (ebp != 0 && time < STACKFRAME_DEPTH) {
  1009b1:	eb 7e                	jmp    100a31 <print_stackframe+0xa3>
		cprintf("ebp:%08x eip:%08x ", ebp, eip);
  1009b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c1:	c7 04 24 28 36 10 00 	movl   $0x103628,(%esp)
  1009c8:	e8 53 f9 ff ff       	call   100320 <cprintf>
		uint32_t* args = (uint32_t*) ebp + 2;
  1009cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009d0:	83 c0 08             	add    $0x8,%eax
  1009d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
		cprintf("args:%08x %08x %08x %08x\n", args[0], args[1], args[2], args[3]);
  1009d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009d9:	83 c0 0c             	add    $0xc,%eax
  1009dc:	8b 18                	mov    (%eax),%ebx
  1009de:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e1:	83 c0 08             	add    $0x8,%eax
  1009e4:	8b 08                	mov    (%eax),%ecx
  1009e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e9:	83 c0 04             	add    $0x4,%eax
  1009ec:	8b 10                	mov    (%eax),%edx
  1009ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009f1:	8b 00                	mov    (%eax),%eax
  1009f3:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  1009f7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1009fb:	89 54 24 08          	mov    %edx,0x8(%esp)
  1009ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a03:	c7 04 24 3b 36 10 00 	movl   $0x10363b,(%esp)
  100a0a:	e8 11 f9 ff ff       	call   100320 <cprintf>
		// eip - 1 is sufficient for us to use binsearch to locate the line.
		print_debuginfo(eip - 1);
  100a0f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a12:	48                   	dec    %eax
  100a13:	89 04 24             	mov    %eax,(%esp)
  100a16:	e8 bc fe ff ff       	call   1008d7 <print_debuginfo>
		eip = *((uint32_t*) ebp + 1);
  100a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a1e:	83 c0 04             	add    $0x4,%eax
  100a21:	8b 00                	mov    (%eax),%eax
  100a23:	89 45 ec             	mov    %eax,-0x14(%ebp)
		ebp = *((uint32_t*) ebp);
  100a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a29:	8b 00                	mov    (%eax),%eax
  100a2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		time++;
  100a2e:	ff 45 f4             	incl   -0xc(%ebp)
	while (ebp != 0 && time < STACKFRAME_DEPTH) {
  100a31:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100a35:	74 0a                	je     100a41 <print_stackframe+0xb3>
  100a37:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  100a3b:	0f 8e 72 ff ff ff    	jle    1009b3 <print_stackframe+0x25>
	}	
}
  100a41:	90                   	nop
  100a42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a45:	89 ec                	mov    %ebp,%esp
  100a47:	5d                   	pop    %ebp
  100a48:	c3                   	ret    

00100a49 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a49:	55                   	push   %ebp
  100a4a:	89 e5                	mov    %esp,%ebp
  100a4c:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a56:	eb 0c                	jmp    100a64 <parse+0x1b>
            *buf ++ = '\0';
  100a58:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5b:	8d 50 01             	lea    0x1(%eax),%edx
  100a5e:	89 55 08             	mov    %edx,0x8(%ebp)
  100a61:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a64:	8b 45 08             	mov    0x8(%ebp),%eax
  100a67:	0f b6 00             	movzbl (%eax),%eax
  100a6a:	84 c0                	test   %al,%al
  100a6c:	74 1d                	je     100a8b <parse+0x42>
  100a6e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a71:	0f b6 00             	movzbl (%eax),%eax
  100a74:	0f be c0             	movsbl %al,%eax
  100a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a7b:	c7 04 24 d8 36 10 00 	movl   $0x1036d8,(%esp)
  100a82:	e8 c3 26 00 00       	call   10314a <strchr>
  100a87:	85 c0                	test   %eax,%eax
  100a89:	75 cd                	jne    100a58 <parse+0xf>
        }
        if (*buf == '\0') {
  100a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a8e:	0f b6 00             	movzbl (%eax),%eax
  100a91:	84 c0                	test   %al,%al
  100a93:	74 65                	je     100afa <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a95:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a99:	75 14                	jne    100aaf <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a9b:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100aa2:	00 
  100aa3:	c7 04 24 dd 36 10 00 	movl   $0x1036dd,(%esp)
  100aaa:	e8 71 f8 ff ff       	call   100320 <cprintf>
        }
        argv[argc ++] = buf;
  100aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab2:	8d 50 01             	lea    0x1(%eax),%edx
  100ab5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ab8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100abf:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ac2:	01 c2                	add    %eax,%edx
  100ac4:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac7:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ac9:	eb 03                	jmp    100ace <parse+0x85>
            buf ++;
  100acb:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ace:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad1:	0f b6 00             	movzbl (%eax),%eax
  100ad4:	84 c0                	test   %al,%al
  100ad6:	74 8c                	je     100a64 <parse+0x1b>
  100ad8:	8b 45 08             	mov    0x8(%ebp),%eax
  100adb:	0f b6 00             	movzbl (%eax),%eax
  100ade:	0f be c0             	movsbl %al,%eax
  100ae1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ae5:	c7 04 24 d8 36 10 00 	movl   $0x1036d8,(%esp)
  100aec:	e8 59 26 00 00       	call   10314a <strchr>
  100af1:	85 c0                	test   %eax,%eax
  100af3:	74 d6                	je     100acb <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100af5:	e9 6a ff ff ff       	jmp    100a64 <parse+0x1b>
            break;
  100afa:	90                   	nop
        }
    }
    return argc;
  100afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100afe:	89 ec                	mov    %ebp,%esp
  100b00:	5d                   	pop    %ebp
  100b01:	c3                   	ret    

00100b02 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b02:	55                   	push   %ebp
  100b03:	89 e5                	mov    %esp,%ebp
  100b05:	83 ec 68             	sub    $0x68,%esp
  100b08:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b0b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b0e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b12:	8b 45 08             	mov    0x8(%ebp),%eax
  100b15:	89 04 24             	mov    %eax,(%esp)
  100b18:	e8 2c ff ff ff       	call   100a49 <parse>
  100b1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b20:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b24:	75 0a                	jne    100b30 <runcmd+0x2e>
        return 0;
  100b26:	b8 00 00 00 00       	mov    $0x0,%eax
  100b2b:	e9 83 00 00 00       	jmp    100bb3 <runcmd+0xb1>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b30:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b37:	eb 5a                	jmp    100b93 <runcmd+0x91>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b39:	8b 55 b0             	mov    -0x50(%ebp),%edx
  100b3c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100b3f:	89 c8                	mov    %ecx,%eax
  100b41:	01 c0                	add    %eax,%eax
  100b43:	01 c8                	add    %ecx,%eax
  100b45:	c1 e0 02             	shl    $0x2,%eax
  100b48:	05 00 f0 10 00       	add    $0x10f000,%eax
  100b4d:	8b 00                	mov    (%eax),%eax
  100b4f:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b53:	89 04 24             	mov    %eax,(%esp)
  100b56:	e8 53 25 00 00       	call   1030ae <strcmp>
  100b5b:	85 c0                	test   %eax,%eax
  100b5d:	75 31                	jne    100b90 <runcmd+0x8e>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b5f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b62:	89 d0                	mov    %edx,%eax
  100b64:	01 c0                	add    %eax,%eax
  100b66:	01 d0                	add    %edx,%eax
  100b68:	c1 e0 02             	shl    $0x2,%eax
  100b6b:	05 08 f0 10 00       	add    $0x10f008,%eax
  100b70:	8b 10                	mov    (%eax),%edx
  100b72:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b75:	83 c0 04             	add    $0x4,%eax
  100b78:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b7b:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100b7e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100b81:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b85:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b89:	89 1c 24             	mov    %ebx,(%esp)
  100b8c:	ff d2                	call   *%edx
  100b8e:	eb 23                	jmp    100bb3 <runcmd+0xb1>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b90:	ff 45 f4             	incl   -0xc(%ebp)
  100b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b96:	83 f8 02             	cmp    $0x2,%eax
  100b99:	76 9e                	jbe    100b39 <runcmd+0x37>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b9b:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba2:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  100ba9:	e8 72 f7 ff ff       	call   100320 <cprintf>
    return 0;
  100bae:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bb3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100bb6:	89 ec                	mov    %ebp,%esp
  100bb8:	5d                   	pop    %ebp
  100bb9:	c3                   	ret    

00100bba <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bba:	55                   	push   %ebp
  100bbb:	89 e5                	mov    %esp,%ebp
  100bbd:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bc0:	c7 04 24 14 37 10 00 	movl   $0x103714,(%esp)
  100bc7:	e8 54 f7 ff ff       	call   100320 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bcc:	c7 04 24 3c 37 10 00 	movl   $0x10373c,(%esp)
  100bd3:	e8 48 f7 ff ff       	call   100320 <cprintf>

    if (tf != NULL) {
  100bd8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bdc:	74 0b                	je     100be9 <kmonitor+0x2f>
        print_trapframe(tf);
  100bde:	8b 45 08             	mov    0x8(%ebp),%eax
  100be1:	89 04 24             	mov    %eax,(%esp)
  100be4:	e8 0b 0e 00 00       	call   1019f4 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100be9:	c7 04 24 61 37 10 00 	movl   $0x103761,(%esp)
  100bf0:	e8 1c f6 ff ff       	call   100211 <readline>
  100bf5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bf8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bfc:	74 eb                	je     100be9 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100bfe:	8b 45 08             	mov    0x8(%ebp),%eax
  100c01:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c08:	89 04 24             	mov    %eax,(%esp)
  100c0b:	e8 f2 fe ff ff       	call   100b02 <runcmd>
  100c10:	85 c0                	test   %eax,%eax
  100c12:	78 02                	js     100c16 <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100c14:	eb d3                	jmp    100be9 <kmonitor+0x2f>
                break;
  100c16:	90                   	nop
            }
        }
    }
}
  100c17:	90                   	nop
  100c18:	89 ec                	mov    %ebp,%esp
  100c1a:	5d                   	pop    %ebp
  100c1b:	c3                   	ret    

00100c1c <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c1c:	55                   	push   %ebp
  100c1d:	89 e5                	mov    %esp,%ebp
  100c1f:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c29:	eb 3d                	jmp    100c68 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c2e:	89 d0                	mov    %edx,%eax
  100c30:	01 c0                	add    %eax,%eax
  100c32:	01 d0                	add    %edx,%eax
  100c34:	c1 e0 02             	shl    $0x2,%eax
  100c37:	05 04 f0 10 00       	add    $0x10f004,%eax
  100c3c:	8b 10                	mov    (%eax),%edx
  100c3e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100c41:	89 c8                	mov    %ecx,%eax
  100c43:	01 c0                	add    %eax,%eax
  100c45:	01 c8                	add    %ecx,%eax
  100c47:	c1 e0 02             	shl    $0x2,%eax
  100c4a:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c4f:	8b 00                	mov    (%eax),%eax
  100c51:	89 54 24 08          	mov    %edx,0x8(%esp)
  100c55:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c59:	c7 04 24 65 37 10 00 	movl   $0x103765,(%esp)
  100c60:	e8 bb f6 ff ff       	call   100320 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c65:	ff 45 f4             	incl   -0xc(%ebp)
  100c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c6b:	83 f8 02             	cmp    $0x2,%eax
  100c6e:	76 bb                	jbe    100c2b <mon_help+0xf>
    }
    return 0;
  100c70:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c75:	89 ec                	mov    %ebp,%esp
  100c77:	5d                   	pop    %ebp
  100c78:	c3                   	ret    

00100c79 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c79:	55                   	push   %ebp
  100c7a:	89 e5                	mov    %esp,%ebp
  100c7c:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c7f:	e8 bf fb ff ff       	call   100843 <print_kerninfo>
    return 0;
  100c84:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c89:	89 ec                	mov    %ebp,%esp
  100c8b:	5d                   	pop    %ebp
  100c8c:	c3                   	ret    

00100c8d <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c8d:	55                   	push   %ebp
  100c8e:	89 e5                	mov    %esp,%ebp
  100c90:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c93:	e8 f6 fc ff ff       	call   10098e <print_stackframe>
    return 0;
  100c98:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c9d:	89 ec                	mov    %ebp,%esp
  100c9f:	5d                   	pop    %ebp
  100ca0:	c3                   	ret    

00100ca1 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100ca1:	55                   	push   %ebp
  100ca2:	89 e5                	mov    %esp,%ebp
  100ca4:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100ca7:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100cac:	85 c0                	test   %eax,%eax
  100cae:	75 5b                	jne    100d0b <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  100cb0:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  100cb7:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cba:	8d 45 14             	lea    0x14(%ebp),%eax
  100cbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cc0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cc3:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cc7:	8b 45 08             	mov    0x8(%ebp),%eax
  100cca:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cce:	c7 04 24 6e 37 10 00 	movl   $0x10376e,(%esp)
  100cd5:	e8 46 f6 ff ff       	call   100320 <cprintf>
    vcprintf(fmt, ap);
  100cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cdd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce1:	8b 45 10             	mov    0x10(%ebp),%eax
  100ce4:	89 04 24             	mov    %eax,(%esp)
  100ce7:	e8 ff f5 ff ff       	call   1002eb <vcprintf>
    cprintf("\n");
  100cec:	c7 04 24 8a 37 10 00 	movl   $0x10378a,(%esp)
  100cf3:	e8 28 f6 ff ff       	call   100320 <cprintf>
    
    cprintf("stack trackback:\n");
  100cf8:	c7 04 24 8c 37 10 00 	movl   $0x10378c,(%esp)
  100cff:	e8 1c f6 ff ff       	call   100320 <cprintf>
    print_stackframe();
  100d04:	e8 85 fc ff ff       	call   10098e <print_stackframe>
  100d09:	eb 01                	jmp    100d0c <__panic+0x6b>
        goto panic_dead;
  100d0b:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100d0c:	e8 81 09 00 00       	call   101692 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d11:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d18:	e8 9d fe ff ff       	call   100bba <kmonitor>
  100d1d:	eb f2                	jmp    100d11 <__panic+0x70>

00100d1f <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d1f:	55                   	push   %ebp
  100d20:	89 e5                	mov    %esp,%ebp
  100d22:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d25:	8d 45 14             	lea    0x14(%ebp),%eax
  100d28:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d2b:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d2e:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d32:	8b 45 08             	mov    0x8(%ebp),%eax
  100d35:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d39:	c7 04 24 9e 37 10 00 	movl   $0x10379e,(%esp)
  100d40:	e8 db f5 ff ff       	call   100320 <cprintf>
    vcprintf(fmt, ap);
  100d45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d48:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d4c:	8b 45 10             	mov    0x10(%ebp),%eax
  100d4f:	89 04 24             	mov    %eax,(%esp)
  100d52:	e8 94 f5 ff ff       	call   1002eb <vcprintf>
    cprintf("\n");
  100d57:	c7 04 24 8a 37 10 00 	movl   $0x10378a,(%esp)
  100d5e:	e8 bd f5 ff ff       	call   100320 <cprintf>
    va_end(ap);
}
  100d63:	90                   	nop
  100d64:	89 ec                	mov    %ebp,%esp
  100d66:	5d                   	pop    %ebp
  100d67:	c3                   	ret    

00100d68 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d68:	55                   	push   %ebp
  100d69:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d6b:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  100d70:	5d                   	pop    %ebp
  100d71:	c3                   	ret    

00100d72 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d72:	55                   	push   %ebp
  100d73:	89 e5                	mov    %esp,%ebp
  100d75:	83 ec 28             	sub    $0x28,%esp
  100d78:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d7e:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d82:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d86:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d8a:	ee                   	out    %al,(%dx)
}
  100d8b:	90                   	nop
  100d8c:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d92:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d96:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d9a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d9e:	ee                   	out    %al,(%dx)
}
  100d9f:	90                   	nop
  100da0:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100da6:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100daa:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100dae:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100db2:	ee                   	out    %al,(%dx)
}
  100db3:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100db4:	c7 05 44 fe 10 00 00 	movl   $0x0,0x10fe44
  100dbb:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100dbe:	c7 04 24 bc 37 10 00 	movl   $0x1037bc,(%esp)
  100dc5:	e8 56 f5 ff ff       	call   100320 <cprintf>
    pic_enable(IRQ_TIMER);
  100dca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dd1:	e8 21 09 00 00       	call   1016f7 <pic_enable>
}
  100dd6:	90                   	nop
  100dd7:	89 ec                	mov    %ebp,%esp
  100dd9:	5d                   	pop    %ebp
  100dda:	c3                   	ret    

00100ddb <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100ddb:	55                   	push   %ebp
  100ddc:	89 e5                	mov    %esp,%ebp
  100dde:	83 ec 10             	sub    $0x10,%esp
  100de1:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100de7:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100deb:	89 c2                	mov    %eax,%edx
  100ded:	ec                   	in     (%dx),%al
  100dee:	88 45 f1             	mov    %al,-0xf(%ebp)
  100df1:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100df7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dfb:	89 c2                	mov    %eax,%edx
  100dfd:	ec                   	in     (%dx),%al
  100dfe:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e01:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e07:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e0b:	89 c2                	mov    %eax,%edx
  100e0d:	ec                   	in     (%dx),%al
  100e0e:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e11:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e17:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e1b:	89 c2                	mov    %eax,%edx
  100e1d:	ec                   	in     (%dx),%al
  100e1e:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e21:	90                   	nop
  100e22:	89 ec                	mov    %ebp,%esp
  100e24:	5d                   	pop    %ebp
  100e25:	c3                   	ret    

00100e26 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e26:	55                   	push   %ebp
  100e27:	89 e5                	mov    %esp,%ebp
  100e29:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e2c:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e33:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e36:	0f b7 00             	movzwl (%eax),%eax
  100e39:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e40:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e45:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e48:	0f b7 00             	movzwl (%eax),%eax
  100e4b:	0f b7 c0             	movzwl %ax,%eax
  100e4e:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e53:	74 12                	je     100e67 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e55:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e5c:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100e63:	b4 03 
  100e65:	eb 13                	jmp    100e7a <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e67:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e6a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e6e:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e71:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100e78:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e7a:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e81:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e85:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e89:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e8d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e91:	ee                   	out    %al,(%dx)
}
  100e92:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e93:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e9a:	40                   	inc    %eax
  100e9b:	0f b7 c0             	movzwl %ax,%eax
  100e9e:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ea2:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ea6:	89 c2                	mov    %eax,%edx
  100ea8:	ec                   	in     (%dx),%al
  100ea9:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100eac:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eb0:	0f b6 c0             	movzbl %al,%eax
  100eb3:	c1 e0 08             	shl    $0x8,%eax
  100eb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100eb9:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ec0:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100ec4:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ec8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ecc:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ed0:	ee                   	out    %al,(%dx)
}
  100ed1:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ed2:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ed9:	40                   	inc    %eax
  100eda:	0f b7 c0             	movzwl %ax,%eax
  100edd:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ee1:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ee5:	89 c2                	mov    %eax,%edx
  100ee7:	ec                   	in     (%dx),%al
  100ee8:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100eeb:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100eef:	0f b6 c0             	movzbl %al,%eax
  100ef2:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ef5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ef8:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f00:	0f b7 c0             	movzwl %ax,%eax
  100f03:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f09:	90                   	nop
  100f0a:	89 ec                	mov    %ebp,%esp
  100f0c:	5d                   	pop    %ebp
  100f0d:	c3                   	ret    

00100f0e <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f0e:	55                   	push   %ebp
  100f0f:	89 e5                	mov    %esp,%ebp
  100f11:	83 ec 48             	sub    $0x48,%esp
  100f14:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f1a:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f1e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f22:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f26:	ee                   	out    %al,(%dx)
}
  100f27:	90                   	nop
  100f28:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f2e:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f32:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f36:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f3a:	ee                   	out    %al,(%dx)
}
  100f3b:	90                   	nop
  100f3c:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f42:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f46:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f4a:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f4e:	ee                   	out    %al,(%dx)
}
  100f4f:	90                   	nop
  100f50:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f56:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f5a:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f5e:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f62:	ee                   	out    %al,(%dx)
}
  100f63:	90                   	nop
  100f64:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f6a:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f6e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f72:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f76:	ee                   	out    %al,(%dx)
}
  100f77:	90                   	nop
  100f78:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f7e:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f82:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f86:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f8a:	ee                   	out    %al,(%dx)
}
  100f8b:	90                   	nop
  100f8c:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f92:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f96:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f9a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f9e:	ee                   	out    %al,(%dx)
}
  100f9f:	90                   	nop
  100fa0:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa6:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100faa:	89 c2                	mov    %eax,%edx
  100fac:	ec                   	in     (%dx),%al
  100fad:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100fb0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fb4:	3c ff                	cmp    $0xff,%al
  100fb6:	0f 95 c0             	setne  %al
  100fb9:	0f b6 c0             	movzbl %al,%eax
  100fbc:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100fc1:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fc7:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100fcb:	89 c2                	mov    %eax,%edx
  100fcd:	ec                   	in     (%dx),%al
  100fce:	88 45 f1             	mov    %al,-0xf(%ebp)
  100fd1:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100fd7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fdb:	89 c2                	mov    %eax,%edx
  100fdd:	ec                   	in     (%dx),%al
  100fde:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fe1:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  100fe6:	85 c0                	test   %eax,%eax
  100fe8:	74 0c                	je     100ff6 <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  100fea:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100ff1:	e8 01 07 00 00       	call   1016f7 <pic_enable>
    }
}
  100ff6:	90                   	nop
  100ff7:	89 ec                	mov    %ebp,%esp
  100ff9:	5d                   	pop    %ebp
  100ffa:	c3                   	ret    

00100ffb <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100ffb:	55                   	push   %ebp
  100ffc:	89 e5                	mov    %esp,%ebp
  100ffe:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101001:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101008:	eb 08                	jmp    101012 <lpt_putc_sub+0x17>
        delay();
  10100a:	e8 cc fd ff ff       	call   100ddb <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10100f:	ff 45 fc             	incl   -0x4(%ebp)
  101012:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101018:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10101c:	89 c2                	mov    %eax,%edx
  10101e:	ec                   	in     (%dx),%al
  10101f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101022:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101026:	84 c0                	test   %al,%al
  101028:	78 09                	js     101033 <lpt_putc_sub+0x38>
  10102a:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101031:	7e d7                	jle    10100a <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  101033:	8b 45 08             	mov    0x8(%ebp),%eax
  101036:	0f b6 c0             	movzbl %al,%eax
  101039:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  10103f:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101042:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101046:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10104a:	ee                   	out    %al,(%dx)
}
  10104b:	90                   	nop
  10104c:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101052:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101056:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10105a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10105e:	ee                   	out    %al,(%dx)
}
  10105f:	90                   	nop
  101060:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101066:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10106a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10106e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101072:	ee                   	out    %al,(%dx)
}
  101073:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101074:	90                   	nop
  101075:	89 ec                	mov    %ebp,%esp
  101077:	5d                   	pop    %ebp
  101078:	c3                   	ret    

00101079 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101079:	55                   	push   %ebp
  10107a:	89 e5                	mov    %esp,%ebp
  10107c:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10107f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101083:	74 0d                	je     101092 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101085:	8b 45 08             	mov    0x8(%ebp),%eax
  101088:	89 04 24             	mov    %eax,(%esp)
  10108b:	e8 6b ff ff ff       	call   100ffb <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101090:	eb 24                	jmp    1010b6 <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  101092:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101099:	e8 5d ff ff ff       	call   100ffb <lpt_putc_sub>
        lpt_putc_sub(' ');
  10109e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010a5:	e8 51 ff ff ff       	call   100ffb <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010aa:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010b1:	e8 45 ff ff ff       	call   100ffb <lpt_putc_sub>
}
  1010b6:	90                   	nop
  1010b7:	89 ec                	mov    %ebp,%esp
  1010b9:	5d                   	pop    %ebp
  1010ba:	c3                   	ret    

001010bb <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010bb:	55                   	push   %ebp
  1010bc:	89 e5                	mov    %esp,%ebp
  1010be:	83 ec 38             	sub    $0x38,%esp
  1010c1:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    // set black on white
    if (!(c & ~0xFF)) {
  1010c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1010c7:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010cc:	85 c0                	test   %eax,%eax
  1010ce:	75 07                	jne    1010d7 <cga_putc+0x1c>
        c |= 0x0700;
  1010d0:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1010da:	0f b6 c0             	movzbl %al,%eax
  1010dd:	83 f8 0d             	cmp    $0xd,%eax
  1010e0:	74 72                	je     101154 <cga_putc+0x99>
  1010e2:	83 f8 0d             	cmp    $0xd,%eax
  1010e5:	0f 8f a3 00 00 00    	jg     10118e <cga_putc+0xd3>
  1010eb:	83 f8 08             	cmp    $0x8,%eax
  1010ee:	74 0a                	je     1010fa <cga_putc+0x3f>
  1010f0:	83 f8 0a             	cmp    $0xa,%eax
  1010f3:	74 4c                	je     101141 <cga_putc+0x86>
  1010f5:	e9 94 00 00 00       	jmp    10118e <cga_putc+0xd3>
    case '\b':
        if (crt_pos > 0) {
  1010fa:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101101:	85 c0                	test   %eax,%eax
  101103:	0f 84 af 00 00 00    	je     1011b8 <cga_putc+0xfd>
            crt_pos --;
  101109:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101110:	48                   	dec    %eax
  101111:	0f b7 c0             	movzwl %ax,%eax
  101114:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10111a:	8b 45 08             	mov    0x8(%ebp),%eax
  10111d:	98                   	cwtl   
  10111e:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101123:	98                   	cwtl   
  101124:	83 c8 20             	or     $0x20,%eax
  101127:	98                   	cwtl   
  101128:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  10112e:	0f b7 15 64 fe 10 00 	movzwl 0x10fe64,%edx
  101135:	01 d2                	add    %edx,%edx
  101137:	01 ca                	add    %ecx,%edx
  101139:	0f b7 c0             	movzwl %ax,%eax
  10113c:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  10113f:	eb 77                	jmp    1011b8 <cga_putc+0xfd>
    case '\n':
        crt_pos += CRT_COLS;
  101141:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101148:	83 c0 50             	add    $0x50,%eax
  10114b:	0f b7 c0             	movzwl %ax,%eax
  10114e:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101154:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  10115b:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101162:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101167:	89 c8                	mov    %ecx,%eax
  101169:	f7 e2                	mul    %edx
  10116b:	c1 ea 06             	shr    $0x6,%edx
  10116e:	89 d0                	mov    %edx,%eax
  101170:	c1 e0 02             	shl    $0x2,%eax
  101173:	01 d0                	add    %edx,%eax
  101175:	c1 e0 04             	shl    $0x4,%eax
  101178:	29 c1                	sub    %eax,%ecx
  10117a:	89 ca                	mov    %ecx,%edx
  10117c:	0f b7 d2             	movzwl %dx,%edx
  10117f:	89 d8                	mov    %ebx,%eax
  101181:	29 d0                	sub    %edx,%eax
  101183:	0f b7 c0             	movzwl %ax,%eax
  101186:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  10118c:	eb 2b                	jmp    1011b9 <cga_putc+0xfe>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10118e:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  101194:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10119b:	8d 50 01             	lea    0x1(%eax),%edx
  10119e:	0f b7 d2             	movzwl %dx,%edx
  1011a1:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011a8:	01 c0                	add    %eax,%eax
  1011aa:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1011ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b0:	0f b7 c0             	movzwl %ax,%eax
  1011b3:	66 89 02             	mov    %ax,(%edx)
        break;
  1011b6:	eb 01                	jmp    1011b9 <cga_putc+0xfe>
        break;
  1011b8:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1011b9:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011c0:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1011c5:	76 5e                	jbe    101225 <cga_putc+0x16a>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011c7:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011cc:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011d2:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011d7:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011de:	00 
  1011df:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011e3:	89 04 24             	mov    %eax,(%esp)
  1011e6:	e8 5d 21 00 00       	call   103348 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011eb:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011f2:	eb 15                	jmp    101209 <cga_putc+0x14e>
            crt_buf[i] = 0x0700 | ' ';
  1011f4:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  1011fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1011fd:	01 c0                	add    %eax,%eax
  1011ff:	01 d0                	add    %edx,%eax
  101201:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101206:	ff 45 f4             	incl   -0xc(%ebp)
  101209:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101210:	7e e2                	jle    1011f4 <cga_putc+0x139>
        }
        crt_pos -= CRT_COLS;
  101212:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101219:	83 e8 50             	sub    $0x50,%eax
  10121c:	0f b7 c0             	movzwl %ax,%eax
  10121f:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101225:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10122c:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101230:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101234:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101238:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10123c:	ee                   	out    %al,(%dx)
}
  10123d:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  10123e:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101245:	c1 e8 08             	shr    $0x8,%eax
  101248:	0f b7 c0             	movzwl %ax,%eax
  10124b:	0f b6 c0             	movzbl %al,%eax
  10124e:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  101255:	42                   	inc    %edx
  101256:	0f b7 d2             	movzwl %dx,%edx
  101259:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10125d:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101260:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101264:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101268:	ee                   	out    %al,(%dx)
}
  101269:	90                   	nop
    outb(addr_6845, 15);
  10126a:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101271:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101275:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101279:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10127d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101281:	ee                   	out    %al,(%dx)
}
  101282:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  101283:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10128a:	0f b6 c0             	movzbl %al,%eax
  10128d:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  101294:	42                   	inc    %edx
  101295:	0f b7 d2             	movzwl %dx,%edx
  101298:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  10129c:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10129f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012a3:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012a7:	ee                   	out    %al,(%dx)
}
  1012a8:	90                   	nop
}
  1012a9:	90                   	nop
  1012aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012ad:	89 ec                	mov    %ebp,%esp
  1012af:	5d                   	pop    %ebp
  1012b0:	c3                   	ret    

001012b1 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012b1:	55                   	push   %ebp
  1012b2:	89 e5                	mov    %esp,%ebp
  1012b4:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1012be:	eb 08                	jmp    1012c8 <serial_putc_sub+0x17>
        delay();
  1012c0:	e8 16 fb ff ff       	call   100ddb <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012c5:	ff 45 fc             	incl   -0x4(%ebp)
  1012c8:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012ce:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012d2:	89 c2                	mov    %eax,%edx
  1012d4:	ec                   	in     (%dx),%al
  1012d5:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012d8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012dc:	0f b6 c0             	movzbl %al,%eax
  1012df:	83 e0 20             	and    $0x20,%eax
  1012e2:	85 c0                	test   %eax,%eax
  1012e4:	75 09                	jne    1012ef <serial_putc_sub+0x3e>
  1012e6:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012ed:	7e d1                	jle    1012c0 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1012f2:	0f b6 c0             	movzbl %al,%eax
  1012f5:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012fb:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012fe:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101302:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101306:	ee                   	out    %al,(%dx)
}
  101307:	90                   	nop
}
  101308:	90                   	nop
  101309:	89 ec                	mov    %ebp,%esp
  10130b:	5d                   	pop    %ebp
  10130c:	c3                   	ret    

0010130d <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10130d:	55                   	push   %ebp
  10130e:	89 e5                	mov    %esp,%ebp
  101310:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101313:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101317:	74 0d                	je     101326 <serial_putc+0x19>
        serial_putc_sub(c);
  101319:	8b 45 08             	mov    0x8(%ebp),%eax
  10131c:	89 04 24             	mov    %eax,(%esp)
  10131f:	e8 8d ff ff ff       	call   1012b1 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101324:	eb 24                	jmp    10134a <serial_putc+0x3d>
        serial_putc_sub('\b');
  101326:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10132d:	e8 7f ff ff ff       	call   1012b1 <serial_putc_sub>
        serial_putc_sub(' ');
  101332:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101339:	e8 73 ff ff ff       	call   1012b1 <serial_putc_sub>
        serial_putc_sub('\b');
  10133e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101345:	e8 67 ff ff ff       	call   1012b1 <serial_putc_sub>
}
  10134a:	90                   	nop
  10134b:	89 ec                	mov    %ebp,%esp
  10134d:	5d                   	pop    %ebp
  10134e:	c3                   	ret    

0010134f <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  10134f:	55                   	push   %ebp
  101350:	89 e5                	mov    %esp,%ebp
  101352:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101355:	eb 33                	jmp    10138a <cons_intr+0x3b>
        if (c != 0) {
  101357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10135b:	74 2d                	je     10138a <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10135d:	a1 84 00 11 00       	mov    0x110084,%eax
  101362:	8d 50 01             	lea    0x1(%eax),%edx
  101365:	89 15 84 00 11 00    	mov    %edx,0x110084
  10136b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10136e:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101374:	a1 84 00 11 00       	mov    0x110084,%eax
  101379:	3d 00 02 00 00       	cmp    $0x200,%eax
  10137e:	75 0a                	jne    10138a <cons_intr+0x3b>
                cons.wpos = 0;
  101380:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  101387:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10138a:	8b 45 08             	mov    0x8(%ebp),%eax
  10138d:	ff d0                	call   *%eax
  10138f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101392:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101396:	75 bf                	jne    101357 <cons_intr+0x8>
            }
        }
    }
}
  101398:	90                   	nop
  101399:	90                   	nop
  10139a:	89 ec                	mov    %ebp,%esp
  10139c:	5d                   	pop    %ebp
  10139d:	c3                   	ret    

0010139e <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10139e:	55                   	push   %ebp
  10139f:	89 e5                	mov    %esp,%ebp
  1013a1:	83 ec 10             	sub    $0x10,%esp
  1013a4:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013aa:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1013ae:	89 c2                	mov    %eax,%edx
  1013b0:	ec                   	in     (%dx),%al
  1013b1:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1013b4:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1013b8:	0f b6 c0             	movzbl %al,%eax
  1013bb:	83 e0 01             	and    $0x1,%eax
  1013be:	85 c0                	test   %eax,%eax
  1013c0:	75 07                	jne    1013c9 <serial_proc_data+0x2b>
        return -1;
  1013c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013c7:	eb 2a                	jmp    1013f3 <serial_proc_data+0x55>
  1013c9:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013cf:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1013d3:	89 c2                	mov    %eax,%edx
  1013d5:	ec                   	in     (%dx),%al
  1013d6:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1013d9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013dd:	0f b6 c0             	movzbl %al,%eax
  1013e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013e3:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013e7:	75 07                	jne    1013f0 <serial_proc_data+0x52>
        c = '\b';
  1013e9:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013f3:	89 ec                	mov    %ebp,%esp
  1013f5:	5d                   	pop    %ebp
  1013f6:	c3                   	ret    

001013f7 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013f7:	55                   	push   %ebp
  1013f8:	89 e5                	mov    %esp,%ebp
  1013fa:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013fd:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101402:	85 c0                	test   %eax,%eax
  101404:	74 0c                	je     101412 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  101406:	c7 04 24 9e 13 10 00 	movl   $0x10139e,(%esp)
  10140d:	e8 3d ff ff ff       	call   10134f <cons_intr>
    }
}
  101412:	90                   	nop
  101413:	89 ec                	mov    %ebp,%esp
  101415:	5d                   	pop    %ebp
  101416:	c3                   	ret    

00101417 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101417:	55                   	push   %ebp
  101418:	89 e5                	mov    %esp,%ebp
  10141a:	83 ec 38             	sub    $0x38,%esp
  10141d:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101423:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101426:	89 c2                	mov    %eax,%edx
  101428:	ec                   	in     (%dx),%al
  101429:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10142c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101430:	0f b6 c0             	movzbl %al,%eax
  101433:	83 e0 01             	and    $0x1,%eax
  101436:	85 c0                	test   %eax,%eax
  101438:	75 0a                	jne    101444 <kbd_proc_data+0x2d>
        return -1;
  10143a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10143f:	e9 56 01 00 00       	jmp    10159a <kbd_proc_data+0x183>
  101444:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10144a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10144d:	89 c2                	mov    %eax,%edx
  10144f:	ec                   	in     (%dx),%al
  101450:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101453:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101457:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10145a:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10145e:	75 17                	jne    101477 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101460:	a1 88 00 11 00       	mov    0x110088,%eax
  101465:	83 c8 40             	or     $0x40,%eax
  101468:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10146d:	b8 00 00 00 00       	mov    $0x0,%eax
  101472:	e9 23 01 00 00       	jmp    10159a <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101477:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10147b:	84 c0                	test   %al,%al
  10147d:	79 45                	jns    1014c4 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10147f:	a1 88 00 11 00       	mov    0x110088,%eax
  101484:	83 e0 40             	and    $0x40,%eax
  101487:	85 c0                	test   %eax,%eax
  101489:	75 08                	jne    101493 <kbd_proc_data+0x7c>
  10148b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10148f:	24 7f                	and    $0x7f,%al
  101491:	eb 04                	jmp    101497 <kbd_proc_data+0x80>
  101493:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101497:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10149a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10149e:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014a5:	0c 40                	or     $0x40,%al
  1014a7:	0f b6 c0             	movzbl %al,%eax
  1014aa:	f7 d0                	not    %eax
  1014ac:	89 c2                	mov    %eax,%edx
  1014ae:	a1 88 00 11 00       	mov    0x110088,%eax
  1014b3:	21 d0                	and    %edx,%eax
  1014b5:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014ba:	b8 00 00 00 00       	mov    $0x0,%eax
  1014bf:	e9 d6 00 00 00       	jmp    10159a <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  1014c4:	a1 88 00 11 00       	mov    0x110088,%eax
  1014c9:	83 e0 40             	and    $0x40,%eax
  1014cc:	85 c0                	test   %eax,%eax
  1014ce:	74 11                	je     1014e1 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1014d0:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1014d4:	a1 88 00 11 00       	mov    0x110088,%eax
  1014d9:	83 e0 bf             	and    $0xffffffbf,%eax
  1014dc:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  1014e1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014e5:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014ec:	0f b6 d0             	movzbl %al,%edx
  1014ef:	a1 88 00 11 00       	mov    0x110088,%eax
  1014f4:	09 d0                	or     %edx,%eax
  1014f6:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  1014fb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ff:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  101506:	0f b6 d0             	movzbl %al,%edx
  101509:	a1 88 00 11 00       	mov    0x110088,%eax
  10150e:	31 d0                	xor    %edx,%eax
  101510:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101515:	a1 88 00 11 00       	mov    0x110088,%eax
  10151a:	83 e0 03             	and    $0x3,%eax
  10151d:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101524:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101528:	01 d0                	add    %edx,%eax
  10152a:	0f b6 00             	movzbl (%eax),%eax
  10152d:	0f b6 c0             	movzbl %al,%eax
  101530:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101533:	a1 88 00 11 00       	mov    0x110088,%eax
  101538:	83 e0 08             	and    $0x8,%eax
  10153b:	85 c0                	test   %eax,%eax
  10153d:	74 22                	je     101561 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  10153f:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101543:	7e 0c                	jle    101551 <kbd_proc_data+0x13a>
  101545:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101549:	7f 06                	jg     101551 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  10154b:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  10154f:	eb 10                	jmp    101561 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  101551:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101555:	7e 0a                	jle    101561 <kbd_proc_data+0x14a>
  101557:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10155b:	7f 04                	jg     101561 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  10155d:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101561:	a1 88 00 11 00       	mov    0x110088,%eax
  101566:	f7 d0                	not    %eax
  101568:	83 e0 06             	and    $0x6,%eax
  10156b:	85 c0                	test   %eax,%eax
  10156d:	75 28                	jne    101597 <kbd_proc_data+0x180>
  10156f:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101576:	75 1f                	jne    101597 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101578:	c7 04 24 d7 37 10 00 	movl   $0x1037d7,(%esp)
  10157f:	e8 9c ed ff ff       	call   100320 <cprintf>
  101584:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10158a:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10158e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101592:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101595:	ee                   	out    %al,(%dx)
}
  101596:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101597:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10159a:	89 ec                	mov    %ebp,%esp
  10159c:	5d                   	pop    %ebp
  10159d:	c3                   	ret    

0010159e <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10159e:	55                   	push   %ebp
  10159f:	89 e5                	mov    %esp,%ebp
  1015a1:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1015a4:	c7 04 24 17 14 10 00 	movl   $0x101417,(%esp)
  1015ab:	e8 9f fd ff ff       	call   10134f <cons_intr>
}
  1015b0:	90                   	nop
  1015b1:	89 ec                	mov    %ebp,%esp
  1015b3:	5d                   	pop    %ebp
  1015b4:	c3                   	ret    

001015b5 <kbd_init>:

static void
kbd_init(void) {
  1015b5:	55                   	push   %ebp
  1015b6:	89 e5                	mov    %esp,%ebp
  1015b8:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1015bb:	e8 de ff ff ff       	call   10159e <kbd_intr>
    pic_enable(IRQ_KBD);
  1015c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1015c7:	e8 2b 01 00 00       	call   1016f7 <pic_enable>
}
  1015cc:	90                   	nop
  1015cd:	89 ec                	mov    %ebp,%esp
  1015cf:	5d                   	pop    %ebp
  1015d0:	c3                   	ret    

001015d1 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1015d1:	55                   	push   %ebp
  1015d2:	89 e5                	mov    %esp,%ebp
  1015d4:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1015d7:	e8 4a f8 ff ff       	call   100e26 <cga_init>
    serial_init();
  1015dc:	e8 2d f9 ff ff       	call   100f0e <serial_init>
    kbd_init();
  1015e1:	e8 cf ff ff ff       	call   1015b5 <kbd_init>
    if (!serial_exists) {
  1015e6:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  1015eb:	85 c0                	test   %eax,%eax
  1015ed:	75 0c                	jne    1015fb <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015ef:	c7 04 24 e3 37 10 00 	movl   $0x1037e3,(%esp)
  1015f6:	e8 25 ed ff ff       	call   100320 <cprintf>
    }
}
  1015fb:	90                   	nop
  1015fc:	89 ec                	mov    %ebp,%esp
  1015fe:	5d                   	pop    %ebp
  1015ff:	c3                   	ret    

00101600 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101600:	55                   	push   %ebp
  101601:	89 e5                	mov    %esp,%ebp
  101603:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101606:	8b 45 08             	mov    0x8(%ebp),%eax
  101609:	89 04 24             	mov    %eax,(%esp)
  10160c:	e8 68 fa ff ff       	call   101079 <lpt_putc>
    cga_putc(c);
  101611:	8b 45 08             	mov    0x8(%ebp),%eax
  101614:	89 04 24             	mov    %eax,(%esp)
  101617:	e8 9f fa ff ff       	call   1010bb <cga_putc>
    serial_putc(c);
  10161c:	8b 45 08             	mov    0x8(%ebp),%eax
  10161f:	89 04 24             	mov    %eax,(%esp)
  101622:	e8 e6 fc ff ff       	call   10130d <serial_putc>
}
  101627:	90                   	nop
  101628:	89 ec                	mov    %ebp,%esp
  10162a:	5d                   	pop    %ebp
  10162b:	c3                   	ret    

0010162c <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10162c:	55                   	push   %ebp
  10162d:	89 e5                	mov    %esp,%ebp
  10162f:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101632:	e8 c0 fd ff ff       	call   1013f7 <serial_intr>
    kbd_intr();
  101637:	e8 62 ff ff ff       	call   10159e <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  10163c:	8b 15 80 00 11 00    	mov    0x110080,%edx
  101642:	a1 84 00 11 00       	mov    0x110084,%eax
  101647:	39 c2                	cmp    %eax,%edx
  101649:	74 36                	je     101681 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10164b:	a1 80 00 11 00       	mov    0x110080,%eax
  101650:	8d 50 01             	lea    0x1(%eax),%edx
  101653:	89 15 80 00 11 00    	mov    %edx,0x110080
  101659:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  101660:	0f b6 c0             	movzbl %al,%eax
  101663:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101666:	a1 80 00 11 00       	mov    0x110080,%eax
  10166b:	3d 00 02 00 00       	cmp    $0x200,%eax
  101670:	75 0a                	jne    10167c <cons_getc+0x50>
            cons.rpos = 0;
  101672:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  101679:	00 00 00 
        }
        return c;
  10167c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10167f:	eb 05                	jmp    101686 <cons_getc+0x5a>
    }
    return 0;
  101681:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101686:	89 ec                	mov    %ebp,%esp
  101688:	5d                   	pop    %ebp
  101689:	c3                   	ret    

0010168a <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  10168a:	55                   	push   %ebp
  10168b:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10168d:	fb                   	sti    
}
  10168e:	90                   	nop
    sti();
}
  10168f:	90                   	nop
  101690:	5d                   	pop    %ebp
  101691:	c3                   	ret    

00101692 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101692:	55                   	push   %ebp
  101693:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  101695:	fa                   	cli    
}
  101696:	90                   	nop
    cli();
}
  101697:	90                   	nop
  101698:	5d                   	pop    %ebp
  101699:	c3                   	ret    

0010169a <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10169a:	55                   	push   %ebp
  10169b:	89 e5                	mov    %esp,%ebp
  10169d:	83 ec 14             	sub    $0x14,%esp
  1016a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a3:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1016a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016aa:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  1016b0:	a1 8c 00 11 00       	mov    0x11008c,%eax
  1016b5:	85 c0                	test   %eax,%eax
  1016b7:	74 39                	je     1016f2 <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  1016b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016bc:	0f b6 c0             	movzbl %al,%eax
  1016bf:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  1016c5:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016c8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016cc:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016d0:	ee                   	out    %al,(%dx)
}
  1016d1:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  1016d2:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016d6:	c1 e8 08             	shr    $0x8,%eax
  1016d9:	0f b7 c0             	movzwl %ax,%eax
  1016dc:	0f b6 c0             	movzbl %al,%eax
  1016df:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  1016e5:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016e8:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016ec:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016f0:	ee                   	out    %al,(%dx)
}
  1016f1:	90                   	nop
    }
}
  1016f2:	90                   	nop
  1016f3:	89 ec                	mov    %ebp,%esp
  1016f5:	5d                   	pop    %ebp
  1016f6:	c3                   	ret    

001016f7 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1016f7:	55                   	push   %ebp
  1016f8:	89 e5                	mov    %esp,%ebp
  1016fa:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016fd:	8b 45 08             	mov    0x8(%ebp),%eax
  101700:	ba 01 00 00 00       	mov    $0x1,%edx
  101705:	88 c1                	mov    %al,%cl
  101707:	d3 e2                	shl    %cl,%edx
  101709:	89 d0                	mov    %edx,%eax
  10170b:	98                   	cwtl   
  10170c:	f7 d0                	not    %eax
  10170e:	0f bf d0             	movswl %ax,%edx
  101711:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101718:	98                   	cwtl   
  101719:	21 d0                	and    %edx,%eax
  10171b:	98                   	cwtl   
  10171c:	0f b7 c0             	movzwl %ax,%eax
  10171f:	89 04 24             	mov    %eax,(%esp)
  101722:	e8 73 ff ff ff       	call   10169a <pic_setmask>
}
  101727:	90                   	nop
  101728:	89 ec                	mov    %ebp,%esp
  10172a:	5d                   	pop    %ebp
  10172b:	c3                   	ret    

0010172c <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10172c:	55                   	push   %ebp
  10172d:	89 e5                	mov    %esp,%ebp
  10172f:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101732:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  101739:	00 00 00 
  10173c:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  101742:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101746:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10174a:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  10174e:	ee                   	out    %al,(%dx)
}
  10174f:	90                   	nop
  101750:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  101756:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10175a:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10175e:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101762:	ee                   	out    %al,(%dx)
}
  101763:	90                   	nop
  101764:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10176a:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10176e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101772:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101776:	ee                   	out    %al,(%dx)
}
  101777:	90                   	nop
  101778:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  10177e:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101782:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101786:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10178a:	ee                   	out    %al,(%dx)
}
  10178b:	90                   	nop
  10178c:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101792:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101796:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10179a:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10179e:	ee                   	out    %al,(%dx)
}
  10179f:	90                   	nop
  1017a0:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  1017a6:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017aa:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1017ae:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1017b2:	ee                   	out    %al,(%dx)
}
  1017b3:	90                   	nop
  1017b4:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  1017ba:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017be:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017c2:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1017c6:	ee                   	out    %al,(%dx)
}
  1017c7:	90                   	nop
  1017c8:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  1017ce:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d2:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1017d6:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017da:	ee                   	out    %al,(%dx)
}
  1017db:	90                   	nop
  1017dc:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  1017e2:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e6:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1017ea:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1017ee:	ee                   	out    %al,(%dx)
}
  1017ef:	90                   	nop
  1017f0:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  1017f6:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017fa:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1017fe:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101802:	ee                   	out    %al,(%dx)
}
  101803:	90                   	nop
  101804:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10180a:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10180e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101812:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101816:	ee                   	out    %al,(%dx)
}
  101817:	90                   	nop
  101818:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10181e:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101822:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101826:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10182a:	ee                   	out    %al,(%dx)
}
  10182b:	90                   	nop
  10182c:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101832:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101836:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10183a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10183e:	ee                   	out    %al,(%dx)
}
  10183f:	90                   	nop
  101840:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101846:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10184a:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10184e:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101852:	ee                   	out    %al,(%dx)
}
  101853:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101854:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  10185b:	3d ff ff 00 00       	cmp    $0xffff,%eax
  101860:	74 0f                	je     101871 <pic_init+0x145>
        pic_setmask(irq_mask);
  101862:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101869:	89 04 24             	mov    %eax,(%esp)
  10186c:	e8 29 fe ff ff       	call   10169a <pic_setmask>
    }
}
  101871:	90                   	nop
  101872:	89 ec                	mov    %ebp,%esp
  101874:	5d                   	pop    %ebp
  101875:	c3                   	ret    

00101876 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101876:	55                   	push   %ebp
  101877:	89 e5                	mov    %esp,%ebp
  101879:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10187c:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101883:	00 
  101884:	c7 04 24 20 38 10 00 	movl   $0x103820,(%esp)
  10188b:	e8 90 ea ff ff       	call   100320 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101890:	c7 04 24 2a 38 10 00 	movl   $0x10382a,(%esp)
  101897:	e8 84 ea ff ff       	call   100320 <cprintf>
    panic("EOT: kernel seems ok.");
  10189c:	c7 44 24 08 38 38 10 	movl   $0x103838,0x8(%esp)
  1018a3:	00 
  1018a4:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  1018ab:	00 
  1018ac:	c7 04 24 4e 38 10 00 	movl   $0x10384e,(%esp)
  1018b3:	e8 e9 f3 ff ff       	call   100ca1 <__panic>

001018b8 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1018b8:	55                   	push   %ebp
  1018b9:	89 e5                	mov    %esp,%ebp
  1018bb:	83 ec 10             	sub    $0x10,%esp
	
	// call extern global variabels __vectors.
	extern uintptr_t __vectors[];
	
	// use __vectors to initialize the idt entry.
	for (int i = 0; i < 256; i++) {
  1018be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1018c5:	e9 c4 00 00 00       	jmp    10198e <idt_init+0xd6>
		SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], 0);
  1018ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cd:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1018d4:	0f b7 d0             	movzwl %ax,%edx
  1018d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018da:	66 89 14 c5 c0 00 11 	mov    %dx,0x1100c0(,%eax,8)
  1018e1:	00 
  1018e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e5:	66 c7 04 c5 c2 00 11 	movw   $0x8,0x1100c2(,%eax,8)
  1018ec:	00 08 00 
  1018ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018f2:	0f b6 14 c5 c4 00 11 	movzbl 0x1100c4(,%eax,8),%edx
  1018f9:	00 
  1018fa:	80 e2 e0             	and    $0xe0,%dl
  1018fd:	88 14 c5 c4 00 11 00 	mov    %dl,0x1100c4(,%eax,8)
  101904:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101907:	0f b6 14 c5 c4 00 11 	movzbl 0x1100c4(,%eax,8),%edx
  10190e:	00 
  10190f:	80 e2 1f             	and    $0x1f,%dl
  101912:	88 14 c5 c4 00 11 00 	mov    %dl,0x1100c4(,%eax,8)
  101919:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10191c:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  101923:	00 
  101924:	80 e2 f0             	and    $0xf0,%dl
  101927:	80 ca 0e             	or     $0xe,%dl
  10192a:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  101931:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101934:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  10193b:	00 
  10193c:	80 e2 ef             	and    $0xef,%dl
  10193f:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  101946:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101949:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  101950:	00 
  101951:	80 e2 9f             	and    $0x9f,%dl
  101954:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  10195b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10195e:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  101965:	00 
  101966:	80 ca 80             	or     $0x80,%dl
  101969:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  101970:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101973:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  10197a:	c1 e8 10             	shr    $0x10,%eax
  10197d:	0f b7 d0             	movzwl %ax,%edx
  101980:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101983:	66 89 14 c5 c6 00 11 	mov    %dx,0x1100c6(,%eax,8)
  10198a:	00 
	for (int i = 0; i < 256; i++) {
  10198b:	ff 45 fc             	incl   -0x4(%ebp)
  10198e:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101995:	0f 8e 2f ff ff ff    	jle    1018ca <idt_init+0x12>
  10199b:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  1019a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019a5:	0f 01 18             	lidtl  (%eax)
}
  1019a8:	90                   	nop
	}

	// lidt instruction to set the IDT with IDTR.
	lidt(&idt_pd);	
}
  1019a9:	90                   	nop
  1019aa:	89 ec                	mov    %ebp,%esp
  1019ac:	5d                   	pop    %ebp
  1019ad:	c3                   	ret    

001019ae <trapname>:

static const char *
trapname(int trapno) {
  1019ae:	55                   	push   %ebp
  1019af:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b4:	83 f8 13             	cmp    $0x13,%eax
  1019b7:	77 0c                	ja     1019c5 <trapname+0x17>
        return excnames[trapno];
  1019b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bc:	8b 04 85 a0 3b 10 00 	mov    0x103ba0(,%eax,4),%eax
  1019c3:	eb 18                	jmp    1019dd <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019c5:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019c9:	7e 0d                	jle    1019d8 <trapname+0x2a>
  1019cb:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019cf:	7f 07                	jg     1019d8 <trapname+0x2a>
        return "Hardware Interrupt";
  1019d1:	b8 5f 38 10 00       	mov    $0x10385f,%eax
  1019d6:	eb 05                	jmp    1019dd <trapname+0x2f>
    }
    return "(unknown trap)";
  1019d8:	b8 72 38 10 00       	mov    $0x103872,%eax
}
  1019dd:	5d                   	pop    %ebp
  1019de:	c3                   	ret    

001019df <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019df:	55                   	push   %ebp
  1019e0:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e5:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019e9:	83 f8 08             	cmp    $0x8,%eax
  1019ec:	0f 94 c0             	sete   %al
  1019ef:	0f b6 c0             	movzbl %al,%eax
}
  1019f2:	5d                   	pop    %ebp
  1019f3:	c3                   	ret    

001019f4 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019f4:	55                   	push   %ebp
  1019f5:	89 e5                	mov    %esp,%ebp
  1019f7:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1019fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a01:	c7 04 24 b3 38 10 00 	movl   $0x1038b3,(%esp)
  101a08:	e8 13 e9 ff ff       	call   100320 <cprintf>
    print_regs(&tf->tf_regs);
  101a0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a10:	89 04 24             	mov    %eax,(%esp)
  101a13:	e8 8f 01 00 00       	call   101ba7 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a18:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a23:	c7 04 24 c4 38 10 00 	movl   $0x1038c4,(%esp)
  101a2a:	e8 f1 e8 ff ff       	call   100320 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a2f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a32:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a36:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a3a:	c7 04 24 d7 38 10 00 	movl   $0x1038d7,(%esp)
  101a41:	e8 da e8 ff ff       	call   100320 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a46:	8b 45 08             	mov    0x8(%ebp),%eax
  101a49:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a4d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a51:	c7 04 24 ea 38 10 00 	movl   $0x1038ea,(%esp)
  101a58:	e8 c3 e8 ff ff       	call   100320 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a5d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a60:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a64:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a68:	c7 04 24 fd 38 10 00 	movl   $0x1038fd,(%esp)
  101a6f:	e8 ac e8 ff ff       	call   100320 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a74:	8b 45 08             	mov    0x8(%ebp),%eax
  101a77:	8b 40 30             	mov    0x30(%eax),%eax
  101a7a:	89 04 24             	mov    %eax,(%esp)
  101a7d:	e8 2c ff ff ff       	call   1019ae <trapname>
  101a82:	8b 55 08             	mov    0x8(%ebp),%edx
  101a85:	8b 52 30             	mov    0x30(%edx),%edx
  101a88:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a8c:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a90:	c7 04 24 10 39 10 00 	movl   $0x103910,(%esp)
  101a97:	e8 84 e8 ff ff       	call   100320 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a9f:	8b 40 34             	mov    0x34(%eax),%eax
  101aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa6:	c7 04 24 22 39 10 00 	movl   $0x103922,(%esp)
  101aad:	e8 6e e8 ff ff       	call   100320 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ab2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab5:	8b 40 38             	mov    0x38(%eax),%eax
  101ab8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101abc:	c7 04 24 31 39 10 00 	movl   $0x103931,(%esp)
  101ac3:	e8 58 e8 ff ff       	call   100320 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101ac8:	8b 45 08             	mov    0x8(%ebp),%eax
  101acb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101acf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad3:	c7 04 24 40 39 10 00 	movl   $0x103940,(%esp)
  101ada:	e8 41 e8 ff ff       	call   100320 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101adf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae2:	8b 40 40             	mov    0x40(%eax),%eax
  101ae5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ae9:	c7 04 24 53 39 10 00 	movl   $0x103953,(%esp)
  101af0:	e8 2b e8 ff ff       	call   100320 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101af5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101afc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b03:	eb 3d                	jmp    101b42 <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b05:	8b 45 08             	mov    0x8(%ebp),%eax
  101b08:	8b 50 40             	mov    0x40(%eax),%edx
  101b0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b0e:	21 d0                	and    %edx,%eax
  101b10:	85 c0                	test   %eax,%eax
  101b12:	74 28                	je     101b3c <print_trapframe+0x148>
  101b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b17:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101b1e:	85 c0                	test   %eax,%eax
  101b20:	74 1a                	je     101b3c <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  101b22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b25:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b30:	c7 04 24 62 39 10 00 	movl   $0x103962,(%esp)
  101b37:	e8 e4 e7 ff ff       	call   100320 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b3c:	ff 45 f4             	incl   -0xc(%ebp)
  101b3f:	d1 65 f0             	shll   -0x10(%ebp)
  101b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b45:	83 f8 17             	cmp    $0x17,%eax
  101b48:	76 bb                	jbe    101b05 <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4d:	8b 40 40             	mov    0x40(%eax),%eax
  101b50:	c1 e8 0c             	shr    $0xc,%eax
  101b53:	83 e0 03             	and    $0x3,%eax
  101b56:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5a:	c7 04 24 66 39 10 00 	movl   $0x103966,(%esp)
  101b61:	e8 ba e7 ff ff       	call   100320 <cprintf>

    if (!trap_in_kernel(tf)) {
  101b66:	8b 45 08             	mov    0x8(%ebp),%eax
  101b69:	89 04 24             	mov    %eax,(%esp)
  101b6c:	e8 6e fe ff ff       	call   1019df <trap_in_kernel>
  101b71:	85 c0                	test   %eax,%eax
  101b73:	75 2d                	jne    101ba2 <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b75:	8b 45 08             	mov    0x8(%ebp),%eax
  101b78:	8b 40 44             	mov    0x44(%eax),%eax
  101b7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b7f:	c7 04 24 6f 39 10 00 	movl   $0x10396f,(%esp)
  101b86:	e8 95 e7 ff ff       	call   100320 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8e:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b92:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b96:	c7 04 24 7e 39 10 00 	movl   $0x10397e,(%esp)
  101b9d:	e8 7e e7 ff ff       	call   100320 <cprintf>
    }
}
  101ba2:	90                   	nop
  101ba3:	89 ec                	mov    %ebp,%esp
  101ba5:	5d                   	pop    %ebp
  101ba6:	c3                   	ret    

00101ba7 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101ba7:	55                   	push   %ebp
  101ba8:	89 e5                	mov    %esp,%ebp
  101baa:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bad:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb0:	8b 00                	mov    (%eax),%eax
  101bb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb6:	c7 04 24 91 39 10 00 	movl   $0x103991,(%esp)
  101bbd:	e8 5e e7 ff ff       	call   100320 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bc2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc5:	8b 40 04             	mov    0x4(%eax),%eax
  101bc8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcc:	c7 04 24 a0 39 10 00 	movl   $0x1039a0,(%esp)
  101bd3:	e8 48 e7 ff ff       	call   100320 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bd8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdb:	8b 40 08             	mov    0x8(%eax),%eax
  101bde:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be2:	c7 04 24 af 39 10 00 	movl   $0x1039af,(%esp)
  101be9:	e8 32 e7 ff ff       	call   100320 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bee:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf1:	8b 40 0c             	mov    0xc(%eax),%eax
  101bf4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf8:	c7 04 24 be 39 10 00 	movl   $0x1039be,(%esp)
  101bff:	e8 1c e7 ff ff       	call   100320 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c04:	8b 45 08             	mov    0x8(%ebp),%eax
  101c07:	8b 40 10             	mov    0x10(%eax),%eax
  101c0a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c0e:	c7 04 24 cd 39 10 00 	movl   $0x1039cd,(%esp)
  101c15:	e8 06 e7 ff ff       	call   100320 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c1d:	8b 40 14             	mov    0x14(%eax),%eax
  101c20:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c24:	c7 04 24 dc 39 10 00 	movl   $0x1039dc,(%esp)
  101c2b:	e8 f0 e6 ff ff       	call   100320 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c30:	8b 45 08             	mov    0x8(%ebp),%eax
  101c33:	8b 40 18             	mov    0x18(%eax),%eax
  101c36:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c3a:	c7 04 24 eb 39 10 00 	movl   $0x1039eb,(%esp)
  101c41:	e8 da e6 ff ff       	call   100320 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c46:	8b 45 08             	mov    0x8(%ebp),%eax
  101c49:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c4c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c50:	c7 04 24 fa 39 10 00 	movl   $0x1039fa,(%esp)
  101c57:	e8 c4 e6 ff ff       	call   100320 <cprintf>
}
  101c5c:	90                   	nop
  101c5d:	89 ec                	mov    %ebp,%esp
  101c5f:	5d                   	pop    %ebp
  101c60:	c3                   	ret    

00101c61 <trap_dispatch>:
// global variable which will record timer interrupt.
uint32_t timer_int = 0;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c61:	55                   	push   %ebp
  101c62:	89 e5                	mov    %esp,%ebp
  101c64:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c67:	8b 45 08             	mov    0x8(%ebp),%eax
  101c6a:	8b 40 30             	mov    0x30(%eax),%eax
  101c6d:	83 f8 79             	cmp    $0x79,%eax
  101c70:	0f 87 cd 00 00 00    	ja     101d43 <trap_dispatch+0xe2>
  101c76:	83 f8 78             	cmp    $0x78,%eax
  101c79:	0f 83 a8 00 00 00    	jae    101d27 <trap_dispatch+0xc6>
  101c7f:	83 f8 2f             	cmp    $0x2f,%eax
  101c82:	0f 87 bb 00 00 00    	ja     101d43 <trap_dispatch+0xe2>
  101c88:	83 f8 2e             	cmp    $0x2e,%eax
  101c8b:	0f 83 e7 00 00 00    	jae    101d78 <trap_dispatch+0x117>
  101c91:	83 f8 24             	cmp    $0x24,%eax
  101c94:	74 45                	je     101cdb <trap_dispatch+0x7a>
  101c96:	83 f8 24             	cmp    $0x24,%eax
  101c99:	0f 87 a4 00 00 00    	ja     101d43 <trap_dispatch+0xe2>
  101c9f:	83 f8 20             	cmp    $0x20,%eax
  101ca2:	74 0a                	je     101cae <trap_dispatch+0x4d>
  101ca4:	83 f8 21             	cmp    $0x21,%eax
  101ca7:	74 58                	je     101d01 <trap_dispatch+0xa0>
  101ca9:	e9 95 00 00 00       	jmp    101d43 <trap_dispatch+0xe2>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
		timer_int++;
  101cae:	a1 a0 00 11 00       	mov    0x1100a0,%eax
  101cb3:	40                   	inc    %eax
  101cb4:	a3 a0 00 11 00       	mov    %eax,0x1100a0
		if (timer_int == TICK_NUM) {
  101cb9:	a1 a0 00 11 00       	mov    0x1100a0,%eax
  101cbe:	83 f8 64             	cmp    $0x64,%eax
  101cc1:	0f 85 b4 00 00 00    	jne    101d7b <trap_dispatch+0x11a>
			print_ticks();
  101cc7:	e8 aa fb ff ff       	call   101876 <print_ticks>
			timer_int = 0;
  101ccc:	c7 05 a0 00 11 00 00 	movl   $0x0,0x1100a0
  101cd3:	00 00 00 
		}
        break;
  101cd6:	e9 a0 00 00 00       	jmp    101d7b <trap_dispatch+0x11a>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cdb:	e8 4c f9 ff ff       	call   10162c <cons_getc>
  101ce0:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101ce3:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ce7:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ceb:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cef:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cf3:	c7 04 24 09 3a 10 00 	movl   $0x103a09,(%esp)
  101cfa:	e8 21 e6 ff ff       	call   100320 <cprintf>
        break;
  101cff:	eb 7b                	jmp    101d7c <trap_dispatch+0x11b>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d01:	e8 26 f9 ff ff       	call   10162c <cons_getc>
  101d06:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d09:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d0d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d11:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d15:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d19:	c7 04 24 1b 3a 10 00 	movl   $0x103a1b,(%esp)
  101d20:	e8 fb e5 ff ff       	call   100320 <cprintf>
        break;
  101d25:	eb 55                	jmp    101d7c <trap_dispatch+0x11b>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101d27:	c7 44 24 08 2a 3a 10 	movl   $0x103a2a,0x8(%esp)
  101d2e:	00 
  101d2f:	c7 44 24 04 b5 00 00 	movl   $0xb5,0x4(%esp)
  101d36:	00 
  101d37:	c7 04 24 4e 38 10 00 	movl   $0x10384e,(%esp)
  101d3e:	e8 5e ef ff ff       	call   100ca1 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d43:	8b 45 08             	mov    0x8(%ebp),%eax
  101d46:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d4a:	83 e0 03             	and    $0x3,%eax
  101d4d:	85 c0                	test   %eax,%eax
  101d4f:	75 2b                	jne    101d7c <trap_dispatch+0x11b>
            print_trapframe(tf);
  101d51:	8b 45 08             	mov    0x8(%ebp),%eax
  101d54:	89 04 24             	mov    %eax,(%esp)
  101d57:	e8 98 fc ff ff       	call   1019f4 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101d5c:	c7 44 24 08 3a 3a 10 	movl   $0x103a3a,0x8(%esp)
  101d63:	00 
  101d64:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
  101d6b:	00 
  101d6c:	c7 04 24 4e 38 10 00 	movl   $0x10384e,(%esp)
  101d73:	e8 29 ef ff ff       	call   100ca1 <__panic>
        break;
  101d78:	90                   	nop
  101d79:	eb 01                	jmp    101d7c <trap_dispatch+0x11b>
        break;
  101d7b:	90                   	nop
        }
    }
}
  101d7c:	90                   	nop
  101d7d:	89 ec                	mov    %ebp,%esp
  101d7f:	5d                   	pop    %ebp
  101d80:	c3                   	ret    

00101d81 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101d81:	55                   	push   %ebp
  101d82:	89 e5                	mov    %esp,%ebp
  101d84:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101d87:	8b 45 08             	mov    0x8(%ebp),%eax
  101d8a:	89 04 24             	mov    %eax,(%esp)
  101d8d:	e8 cf fe ff ff       	call   101c61 <trap_dispatch>
}
  101d92:	90                   	nop
  101d93:	89 ec                	mov    %ebp,%esp
  101d95:	5d                   	pop    %ebp
  101d96:	c3                   	ret    

00101d97 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101d97:	1e                   	push   %ds
    pushl %es
  101d98:	06                   	push   %es
    pushl %fs
  101d99:	0f a0                	push   %fs
    pushl %gs
  101d9b:	0f a8                	push   %gs
    pushal
  101d9d:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101d9e:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101da3:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101da5:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101da7:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101da8:	e8 d4 ff ff ff       	call   101d81 <trap>

    # pop the pushed stack pointer
    popl %esp
  101dad:	5c                   	pop    %esp

00101dae <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101dae:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101daf:	0f a9                	pop    %gs
    popl %fs
  101db1:	0f a1                	pop    %fs
    popl %es
  101db3:	07                   	pop    %es
    popl %ds
  101db4:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101db5:	83 c4 08             	add    $0x8,%esp
    iret
  101db8:	cf                   	iret   

00101db9 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101db9:	6a 00                	push   $0x0
  pushl $0
  101dbb:	6a 00                	push   $0x0
  jmp __alltraps
  101dbd:	e9 d5 ff ff ff       	jmp    101d97 <__alltraps>

00101dc2 <vector1>:
.globl vector1
vector1:
  pushl $0
  101dc2:	6a 00                	push   $0x0
  pushl $1
  101dc4:	6a 01                	push   $0x1
  jmp __alltraps
  101dc6:	e9 cc ff ff ff       	jmp    101d97 <__alltraps>

00101dcb <vector2>:
.globl vector2
vector2:
  pushl $0
  101dcb:	6a 00                	push   $0x0
  pushl $2
  101dcd:	6a 02                	push   $0x2
  jmp __alltraps
  101dcf:	e9 c3 ff ff ff       	jmp    101d97 <__alltraps>

00101dd4 <vector3>:
.globl vector3
vector3:
  pushl $0
  101dd4:	6a 00                	push   $0x0
  pushl $3
  101dd6:	6a 03                	push   $0x3
  jmp __alltraps
  101dd8:	e9 ba ff ff ff       	jmp    101d97 <__alltraps>

00101ddd <vector4>:
.globl vector4
vector4:
  pushl $0
  101ddd:	6a 00                	push   $0x0
  pushl $4
  101ddf:	6a 04                	push   $0x4
  jmp __alltraps
  101de1:	e9 b1 ff ff ff       	jmp    101d97 <__alltraps>

00101de6 <vector5>:
.globl vector5
vector5:
  pushl $0
  101de6:	6a 00                	push   $0x0
  pushl $5
  101de8:	6a 05                	push   $0x5
  jmp __alltraps
  101dea:	e9 a8 ff ff ff       	jmp    101d97 <__alltraps>

00101def <vector6>:
.globl vector6
vector6:
  pushl $0
  101def:	6a 00                	push   $0x0
  pushl $6
  101df1:	6a 06                	push   $0x6
  jmp __alltraps
  101df3:	e9 9f ff ff ff       	jmp    101d97 <__alltraps>

00101df8 <vector7>:
.globl vector7
vector7:
  pushl $0
  101df8:	6a 00                	push   $0x0
  pushl $7
  101dfa:	6a 07                	push   $0x7
  jmp __alltraps
  101dfc:	e9 96 ff ff ff       	jmp    101d97 <__alltraps>

00101e01 <vector8>:
.globl vector8
vector8:
  pushl $8
  101e01:	6a 08                	push   $0x8
  jmp __alltraps
  101e03:	e9 8f ff ff ff       	jmp    101d97 <__alltraps>

00101e08 <vector9>:
.globl vector9
vector9:
  pushl $0
  101e08:	6a 00                	push   $0x0
  pushl $9
  101e0a:	6a 09                	push   $0x9
  jmp __alltraps
  101e0c:	e9 86 ff ff ff       	jmp    101d97 <__alltraps>

00101e11 <vector10>:
.globl vector10
vector10:
  pushl $10
  101e11:	6a 0a                	push   $0xa
  jmp __alltraps
  101e13:	e9 7f ff ff ff       	jmp    101d97 <__alltraps>

00101e18 <vector11>:
.globl vector11
vector11:
  pushl $11
  101e18:	6a 0b                	push   $0xb
  jmp __alltraps
  101e1a:	e9 78 ff ff ff       	jmp    101d97 <__alltraps>

00101e1f <vector12>:
.globl vector12
vector12:
  pushl $12
  101e1f:	6a 0c                	push   $0xc
  jmp __alltraps
  101e21:	e9 71 ff ff ff       	jmp    101d97 <__alltraps>

00101e26 <vector13>:
.globl vector13
vector13:
  pushl $13
  101e26:	6a 0d                	push   $0xd
  jmp __alltraps
  101e28:	e9 6a ff ff ff       	jmp    101d97 <__alltraps>

00101e2d <vector14>:
.globl vector14
vector14:
  pushl $14
  101e2d:	6a 0e                	push   $0xe
  jmp __alltraps
  101e2f:	e9 63 ff ff ff       	jmp    101d97 <__alltraps>

00101e34 <vector15>:
.globl vector15
vector15:
  pushl $0
  101e34:	6a 00                	push   $0x0
  pushl $15
  101e36:	6a 0f                	push   $0xf
  jmp __alltraps
  101e38:	e9 5a ff ff ff       	jmp    101d97 <__alltraps>

00101e3d <vector16>:
.globl vector16
vector16:
  pushl $0
  101e3d:	6a 00                	push   $0x0
  pushl $16
  101e3f:	6a 10                	push   $0x10
  jmp __alltraps
  101e41:	e9 51 ff ff ff       	jmp    101d97 <__alltraps>

00101e46 <vector17>:
.globl vector17
vector17:
  pushl $17
  101e46:	6a 11                	push   $0x11
  jmp __alltraps
  101e48:	e9 4a ff ff ff       	jmp    101d97 <__alltraps>

00101e4d <vector18>:
.globl vector18
vector18:
  pushl $0
  101e4d:	6a 00                	push   $0x0
  pushl $18
  101e4f:	6a 12                	push   $0x12
  jmp __alltraps
  101e51:	e9 41 ff ff ff       	jmp    101d97 <__alltraps>

00101e56 <vector19>:
.globl vector19
vector19:
  pushl $0
  101e56:	6a 00                	push   $0x0
  pushl $19
  101e58:	6a 13                	push   $0x13
  jmp __alltraps
  101e5a:	e9 38 ff ff ff       	jmp    101d97 <__alltraps>

00101e5f <vector20>:
.globl vector20
vector20:
  pushl $0
  101e5f:	6a 00                	push   $0x0
  pushl $20
  101e61:	6a 14                	push   $0x14
  jmp __alltraps
  101e63:	e9 2f ff ff ff       	jmp    101d97 <__alltraps>

00101e68 <vector21>:
.globl vector21
vector21:
  pushl $0
  101e68:	6a 00                	push   $0x0
  pushl $21
  101e6a:	6a 15                	push   $0x15
  jmp __alltraps
  101e6c:	e9 26 ff ff ff       	jmp    101d97 <__alltraps>

00101e71 <vector22>:
.globl vector22
vector22:
  pushl $0
  101e71:	6a 00                	push   $0x0
  pushl $22
  101e73:	6a 16                	push   $0x16
  jmp __alltraps
  101e75:	e9 1d ff ff ff       	jmp    101d97 <__alltraps>

00101e7a <vector23>:
.globl vector23
vector23:
  pushl $0
  101e7a:	6a 00                	push   $0x0
  pushl $23
  101e7c:	6a 17                	push   $0x17
  jmp __alltraps
  101e7e:	e9 14 ff ff ff       	jmp    101d97 <__alltraps>

00101e83 <vector24>:
.globl vector24
vector24:
  pushl $0
  101e83:	6a 00                	push   $0x0
  pushl $24
  101e85:	6a 18                	push   $0x18
  jmp __alltraps
  101e87:	e9 0b ff ff ff       	jmp    101d97 <__alltraps>

00101e8c <vector25>:
.globl vector25
vector25:
  pushl $0
  101e8c:	6a 00                	push   $0x0
  pushl $25
  101e8e:	6a 19                	push   $0x19
  jmp __alltraps
  101e90:	e9 02 ff ff ff       	jmp    101d97 <__alltraps>

00101e95 <vector26>:
.globl vector26
vector26:
  pushl $0
  101e95:	6a 00                	push   $0x0
  pushl $26
  101e97:	6a 1a                	push   $0x1a
  jmp __alltraps
  101e99:	e9 f9 fe ff ff       	jmp    101d97 <__alltraps>

00101e9e <vector27>:
.globl vector27
vector27:
  pushl $0
  101e9e:	6a 00                	push   $0x0
  pushl $27
  101ea0:	6a 1b                	push   $0x1b
  jmp __alltraps
  101ea2:	e9 f0 fe ff ff       	jmp    101d97 <__alltraps>

00101ea7 <vector28>:
.globl vector28
vector28:
  pushl $0
  101ea7:	6a 00                	push   $0x0
  pushl $28
  101ea9:	6a 1c                	push   $0x1c
  jmp __alltraps
  101eab:	e9 e7 fe ff ff       	jmp    101d97 <__alltraps>

00101eb0 <vector29>:
.globl vector29
vector29:
  pushl $0
  101eb0:	6a 00                	push   $0x0
  pushl $29
  101eb2:	6a 1d                	push   $0x1d
  jmp __alltraps
  101eb4:	e9 de fe ff ff       	jmp    101d97 <__alltraps>

00101eb9 <vector30>:
.globl vector30
vector30:
  pushl $0
  101eb9:	6a 00                	push   $0x0
  pushl $30
  101ebb:	6a 1e                	push   $0x1e
  jmp __alltraps
  101ebd:	e9 d5 fe ff ff       	jmp    101d97 <__alltraps>

00101ec2 <vector31>:
.globl vector31
vector31:
  pushl $0
  101ec2:	6a 00                	push   $0x0
  pushl $31
  101ec4:	6a 1f                	push   $0x1f
  jmp __alltraps
  101ec6:	e9 cc fe ff ff       	jmp    101d97 <__alltraps>

00101ecb <vector32>:
.globl vector32
vector32:
  pushl $0
  101ecb:	6a 00                	push   $0x0
  pushl $32
  101ecd:	6a 20                	push   $0x20
  jmp __alltraps
  101ecf:	e9 c3 fe ff ff       	jmp    101d97 <__alltraps>

00101ed4 <vector33>:
.globl vector33
vector33:
  pushl $0
  101ed4:	6a 00                	push   $0x0
  pushl $33
  101ed6:	6a 21                	push   $0x21
  jmp __alltraps
  101ed8:	e9 ba fe ff ff       	jmp    101d97 <__alltraps>

00101edd <vector34>:
.globl vector34
vector34:
  pushl $0
  101edd:	6a 00                	push   $0x0
  pushl $34
  101edf:	6a 22                	push   $0x22
  jmp __alltraps
  101ee1:	e9 b1 fe ff ff       	jmp    101d97 <__alltraps>

00101ee6 <vector35>:
.globl vector35
vector35:
  pushl $0
  101ee6:	6a 00                	push   $0x0
  pushl $35
  101ee8:	6a 23                	push   $0x23
  jmp __alltraps
  101eea:	e9 a8 fe ff ff       	jmp    101d97 <__alltraps>

00101eef <vector36>:
.globl vector36
vector36:
  pushl $0
  101eef:	6a 00                	push   $0x0
  pushl $36
  101ef1:	6a 24                	push   $0x24
  jmp __alltraps
  101ef3:	e9 9f fe ff ff       	jmp    101d97 <__alltraps>

00101ef8 <vector37>:
.globl vector37
vector37:
  pushl $0
  101ef8:	6a 00                	push   $0x0
  pushl $37
  101efa:	6a 25                	push   $0x25
  jmp __alltraps
  101efc:	e9 96 fe ff ff       	jmp    101d97 <__alltraps>

00101f01 <vector38>:
.globl vector38
vector38:
  pushl $0
  101f01:	6a 00                	push   $0x0
  pushl $38
  101f03:	6a 26                	push   $0x26
  jmp __alltraps
  101f05:	e9 8d fe ff ff       	jmp    101d97 <__alltraps>

00101f0a <vector39>:
.globl vector39
vector39:
  pushl $0
  101f0a:	6a 00                	push   $0x0
  pushl $39
  101f0c:	6a 27                	push   $0x27
  jmp __alltraps
  101f0e:	e9 84 fe ff ff       	jmp    101d97 <__alltraps>

00101f13 <vector40>:
.globl vector40
vector40:
  pushl $0
  101f13:	6a 00                	push   $0x0
  pushl $40
  101f15:	6a 28                	push   $0x28
  jmp __alltraps
  101f17:	e9 7b fe ff ff       	jmp    101d97 <__alltraps>

00101f1c <vector41>:
.globl vector41
vector41:
  pushl $0
  101f1c:	6a 00                	push   $0x0
  pushl $41
  101f1e:	6a 29                	push   $0x29
  jmp __alltraps
  101f20:	e9 72 fe ff ff       	jmp    101d97 <__alltraps>

00101f25 <vector42>:
.globl vector42
vector42:
  pushl $0
  101f25:	6a 00                	push   $0x0
  pushl $42
  101f27:	6a 2a                	push   $0x2a
  jmp __alltraps
  101f29:	e9 69 fe ff ff       	jmp    101d97 <__alltraps>

00101f2e <vector43>:
.globl vector43
vector43:
  pushl $0
  101f2e:	6a 00                	push   $0x0
  pushl $43
  101f30:	6a 2b                	push   $0x2b
  jmp __alltraps
  101f32:	e9 60 fe ff ff       	jmp    101d97 <__alltraps>

00101f37 <vector44>:
.globl vector44
vector44:
  pushl $0
  101f37:	6a 00                	push   $0x0
  pushl $44
  101f39:	6a 2c                	push   $0x2c
  jmp __alltraps
  101f3b:	e9 57 fe ff ff       	jmp    101d97 <__alltraps>

00101f40 <vector45>:
.globl vector45
vector45:
  pushl $0
  101f40:	6a 00                	push   $0x0
  pushl $45
  101f42:	6a 2d                	push   $0x2d
  jmp __alltraps
  101f44:	e9 4e fe ff ff       	jmp    101d97 <__alltraps>

00101f49 <vector46>:
.globl vector46
vector46:
  pushl $0
  101f49:	6a 00                	push   $0x0
  pushl $46
  101f4b:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f4d:	e9 45 fe ff ff       	jmp    101d97 <__alltraps>

00101f52 <vector47>:
.globl vector47
vector47:
  pushl $0
  101f52:	6a 00                	push   $0x0
  pushl $47
  101f54:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f56:	e9 3c fe ff ff       	jmp    101d97 <__alltraps>

00101f5b <vector48>:
.globl vector48
vector48:
  pushl $0
  101f5b:	6a 00                	push   $0x0
  pushl $48
  101f5d:	6a 30                	push   $0x30
  jmp __alltraps
  101f5f:	e9 33 fe ff ff       	jmp    101d97 <__alltraps>

00101f64 <vector49>:
.globl vector49
vector49:
  pushl $0
  101f64:	6a 00                	push   $0x0
  pushl $49
  101f66:	6a 31                	push   $0x31
  jmp __alltraps
  101f68:	e9 2a fe ff ff       	jmp    101d97 <__alltraps>

00101f6d <vector50>:
.globl vector50
vector50:
  pushl $0
  101f6d:	6a 00                	push   $0x0
  pushl $50
  101f6f:	6a 32                	push   $0x32
  jmp __alltraps
  101f71:	e9 21 fe ff ff       	jmp    101d97 <__alltraps>

00101f76 <vector51>:
.globl vector51
vector51:
  pushl $0
  101f76:	6a 00                	push   $0x0
  pushl $51
  101f78:	6a 33                	push   $0x33
  jmp __alltraps
  101f7a:	e9 18 fe ff ff       	jmp    101d97 <__alltraps>

00101f7f <vector52>:
.globl vector52
vector52:
  pushl $0
  101f7f:	6a 00                	push   $0x0
  pushl $52
  101f81:	6a 34                	push   $0x34
  jmp __alltraps
  101f83:	e9 0f fe ff ff       	jmp    101d97 <__alltraps>

00101f88 <vector53>:
.globl vector53
vector53:
  pushl $0
  101f88:	6a 00                	push   $0x0
  pushl $53
  101f8a:	6a 35                	push   $0x35
  jmp __alltraps
  101f8c:	e9 06 fe ff ff       	jmp    101d97 <__alltraps>

00101f91 <vector54>:
.globl vector54
vector54:
  pushl $0
  101f91:	6a 00                	push   $0x0
  pushl $54
  101f93:	6a 36                	push   $0x36
  jmp __alltraps
  101f95:	e9 fd fd ff ff       	jmp    101d97 <__alltraps>

00101f9a <vector55>:
.globl vector55
vector55:
  pushl $0
  101f9a:	6a 00                	push   $0x0
  pushl $55
  101f9c:	6a 37                	push   $0x37
  jmp __alltraps
  101f9e:	e9 f4 fd ff ff       	jmp    101d97 <__alltraps>

00101fa3 <vector56>:
.globl vector56
vector56:
  pushl $0
  101fa3:	6a 00                	push   $0x0
  pushl $56
  101fa5:	6a 38                	push   $0x38
  jmp __alltraps
  101fa7:	e9 eb fd ff ff       	jmp    101d97 <__alltraps>

00101fac <vector57>:
.globl vector57
vector57:
  pushl $0
  101fac:	6a 00                	push   $0x0
  pushl $57
  101fae:	6a 39                	push   $0x39
  jmp __alltraps
  101fb0:	e9 e2 fd ff ff       	jmp    101d97 <__alltraps>

00101fb5 <vector58>:
.globl vector58
vector58:
  pushl $0
  101fb5:	6a 00                	push   $0x0
  pushl $58
  101fb7:	6a 3a                	push   $0x3a
  jmp __alltraps
  101fb9:	e9 d9 fd ff ff       	jmp    101d97 <__alltraps>

00101fbe <vector59>:
.globl vector59
vector59:
  pushl $0
  101fbe:	6a 00                	push   $0x0
  pushl $59
  101fc0:	6a 3b                	push   $0x3b
  jmp __alltraps
  101fc2:	e9 d0 fd ff ff       	jmp    101d97 <__alltraps>

00101fc7 <vector60>:
.globl vector60
vector60:
  pushl $0
  101fc7:	6a 00                	push   $0x0
  pushl $60
  101fc9:	6a 3c                	push   $0x3c
  jmp __alltraps
  101fcb:	e9 c7 fd ff ff       	jmp    101d97 <__alltraps>

00101fd0 <vector61>:
.globl vector61
vector61:
  pushl $0
  101fd0:	6a 00                	push   $0x0
  pushl $61
  101fd2:	6a 3d                	push   $0x3d
  jmp __alltraps
  101fd4:	e9 be fd ff ff       	jmp    101d97 <__alltraps>

00101fd9 <vector62>:
.globl vector62
vector62:
  pushl $0
  101fd9:	6a 00                	push   $0x0
  pushl $62
  101fdb:	6a 3e                	push   $0x3e
  jmp __alltraps
  101fdd:	e9 b5 fd ff ff       	jmp    101d97 <__alltraps>

00101fe2 <vector63>:
.globl vector63
vector63:
  pushl $0
  101fe2:	6a 00                	push   $0x0
  pushl $63
  101fe4:	6a 3f                	push   $0x3f
  jmp __alltraps
  101fe6:	e9 ac fd ff ff       	jmp    101d97 <__alltraps>

00101feb <vector64>:
.globl vector64
vector64:
  pushl $0
  101feb:	6a 00                	push   $0x0
  pushl $64
  101fed:	6a 40                	push   $0x40
  jmp __alltraps
  101fef:	e9 a3 fd ff ff       	jmp    101d97 <__alltraps>

00101ff4 <vector65>:
.globl vector65
vector65:
  pushl $0
  101ff4:	6a 00                	push   $0x0
  pushl $65
  101ff6:	6a 41                	push   $0x41
  jmp __alltraps
  101ff8:	e9 9a fd ff ff       	jmp    101d97 <__alltraps>

00101ffd <vector66>:
.globl vector66
vector66:
  pushl $0
  101ffd:	6a 00                	push   $0x0
  pushl $66
  101fff:	6a 42                	push   $0x42
  jmp __alltraps
  102001:	e9 91 fd ff ff       	jmp    101d97 <__alltraps>

00102006 <vector67>:
.globl vector67
vector67:
  pushl $0
  102006:	6a 00                	push   $0x0
  pushl $67
  102008:	6a 43                	push   $0x43
  jmp __alltraps
  10200a:	e9 88 fd ff ff       	jmp    101d97 <__alltraps>

0010200f <vector68>:
.globl vector68
vector68:
  pushl $0
  10200f:	6a 00                	push   $0x0
  pushl $68
  102011:	6a 44                	push   $0x44
  jmp __alltraps
  102013:	e9 7f fd ff ff       	jmp    101d97 <__alltraps>

00102018 <vector69>:
.globl vector69
vector69:
  pushl $0
  102018:	6a 00                	push   $0x0
  pushl $69
  10201a:	6a 45                	push   $0x45
  jmp __alltraps
  10201c:	e9 76 fd ff ff       	jmp    101d97 <__alltraps>

00102021 <vector70>:
.globl vector70
vector70:
  pushl $0
  102021:	6a 00                	push   $0x0
  pushl $70
  102023:	6a 46                	push   $0x46
  jmp __alltraps
  102025:	e9 6d fd ff ff       	jmp    101d97 <__alltraps>

0010202a <vector71>:
.globl vector71
vector71:
  pushl $0
  10202a:	6a 00                	push   $0x0
  pushl $71
  10202c:	6a 47                	push   $0x47
  jmp __alltraps
  10202e:	e9 64 fd ff ff       	jmp    101d97 <__alltraps>

00102033 <vector72>:
.globl vector72
vector72:
  pushl $0
  102033:	6a 00                	push   $0x0
  pushl $72
  102035:	6a 48                	push   $0x48
  jmp __alltraps
  102037:	e9 5b fd ff ff       	jmp    101d97 <__alltraps>

0010203c <vector73>:
.globl vector73
vector73:
  pushl $0
  10203c:	6a 00                	push   $0x0
  pushl $73
  10203e:	6a 49                	push   $0x49
  jmp __alltraps
  102040:	e9 52 fd ff ff       	jmp    101d97 <__alltraps>

00102045 <vector74>:
.globl vector74
vector74:
  pushl $0
  102045:	6a 00                	push   $0x0
  pushl $74
  102047:	6a 4a                	push   $0x4a
  jmp __alltraps
  102049:	e9 49 fd ff ff       	jmp    101d97 <__alltraps>

0010204e <vector75>:
.globl vector75
vector75:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $75
  102050:	6a 4b                	push   $0x4b
  jmp __alltraps
  102052:	e9 40 fd ff ff       	jmp    101d97 <__alltraps>

00102057 <vector76>:
.globl vector76
vector76:
  pushl $0
  102057:	6a 00                	push   $0x0
  pushl $76
  102059:	6a 4c                	push   $0x4c
  jmp __alltraps
  10205b:	e9 37 fd ff ff       	jmp    101d97 <__alltraps>

00102060 <vector77>:
.globl vector77
vector77:
  pushl $0
  102060:	6a 00                	push   $0x0
  pushl $77
  102062:	6a 4d                	push   $0x4d
  jmp __alltraps
  102064:	e9 2e fd ff ff       	jmp    101d97 <__alltraps>

00102069 <vector78>:
.globl vector78
vector78:
  pushl $0
  102069:	6a 00                	push   $0x0
  pushl $78
  10206b:	6a 4e                	push   $0x4e
  jmp __alltraps
  10206d:	e9 25 fd ff ff       	jmp    101d97 <__alltraps>

00102072 <vector79>:
.globl vector79
vector79:
  pushl $0
  102072:	6a 00                	push   $0x0
  pushl $79
  102074:	6a 4f                	push   $0x4f
  jmp __alltraps
  102076:	e9 1c fd ff ff       	jmp    101d97 <__alltraps>

0010207b <vector80>:
.globl vector80
vector80:
  pushl $0
  10207b:	6a 00                	push   $0x0
  pushl $80
  10207d:	6a 50                	push   $0x50
  jmp __alltraps
  10207f:	e9 13 fd ff ff       	jmp    101d97 <__alltraps>

00102084 <vector81>:
.globl vector81
vector81:
  pushl $0
  102084:	6a 00                	push   $0x0
  pushl $81
  102086:	6a 51                	push   $0x51
  jmp __alltraps
  102088:	e9 0a fd ff ff       	jmp    101d97 <__alltraps>

0010208d <vector82>:
.globl vector82
vector82:
  pushl $0
  10208d:	6a 00                	push   $0x0
  pushl $82
  10208f:	6a 52                	push   $0x52
  jmp __alltraps
  102091:	e9 01 fd ff ff       	jmp    101d97 <__alltraps>

00102096 <vector83>:
.globl vector83
vector83:
  pushl $0
  102096:	6a 00                	push   $0x0
  pushl $83
  102098:	6a 53                	push   $0x53
  jmp __alltraps
  10209a:	e9 f8 fc ff ff       	jmp    101d97 <__alltraps>

0010209f <vector84>:
.globl vector84
vector84:
  pushl $0
  10209f:	6a 00                	push   $0x0
  pushl $84
  1020a1:	6a 54                	push   $0x54
  jmp __alltraps
  1020a3:	e9 ef fc ff ff       	jmp    101d97 <__alltraps>

001020a8 <vector85>:
.globl vector85
vector85:
  pushl $0
  1020a8:	6a 00                	push   $0x0
  pushl $85
  1020aa:	6a 55                	push   $0x55
  jmp __alltraps
  1020ac:	e9 e6 fc ff ff       	jmp    101d97 <__alltraps>

001020b1 <vector86>:
.globl vector86
vector86:
  pushl $0
  1020b1:	6a 00                	push   $0x0
  pushl $86
  1020b3:	6a 56                	push   $0x56
  jmp __alltraps
  1020b5:	e9 dd fc ff ff       	jmp    101d97 <__alltraps>

001020ba <vector87>:
.globl vector87
vector87:
  pushl $0
  1020ba:	6a 00                	push   $0x0
  pushl $87
  1020bc:	6a 57                	push   $0x57
  jmp __alltraps
  1020be:	e9 d4 fc ff ff       	jmp    101d97 <__alltraps>

001020c3 <vector88>:
.globl vector88
vector88:
  pushl $0
  1020c3:	6a 00                	push   $0x0
  pushl $88
  1020c5:	6a 58                	push   $0x58
  jmp __alltraps
  1020c7:	e9 cb fc ff ff       	jmp    101d97 <__alltraps>

001020cc <vector89>:
.globl vector89
vector89:
  pushl $0
  1020cc:	6a 00                	push   $0x0
  pushl $89
  1020ce:	6a 59                	push   $0x59
  jmp __alltraps
  1020d0:	e9 c2 fc ff ff       	jmp    101d97 <__alltraps>

001020d5 <vector90>:
.globl vector90
vector90:
  pushl $0
  1020d5:	6a 00                	push   $0x0
  pushl $90
  1020d7:	6a 5a                	push   $0x5a
  jmp __alltraps
  1020d9:	e9 b9 fc ff ff       	jmp    101d97 <__alltraps>

001020de <vector91>:
.globl vector91
vector91:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $91
  1020e0:	6a 5b                	push   $0x5b
  jmp __alltraps
  1020e2:	e9 b0 fc ff ff       	jmp    101d97 <__alltraps>

001020e7 <vector92>:
.globl vector92
vector92:
  pushl $0
  1020e7:	6a 00                	push   $0x0
  pushl $92
  1020e9:	6a 5c                	push   $0x5c
  jmp __alltraps
  1020eb:	e9 a7 fc ff ff       	jmp    101d97 <__alltraps>

001020f0 <vector93>:
.globl vector93
vector93:
  pushl $0
  1020f0:	6a 00                	push   $0x0
  pushl $93
  1020f2:	6a 5d                	push   $0x5d
  jmp __alltraps
  1020f4:	e9 9e fc ff ff       	jmp    101d97 <__alltraps>

001020f9 <vector94>:
.globl vector94
vector94:
  pushl $0
  1020f9:	6a 00                	push   $0x0
  pushl $94
  1020fb:	6a 5e                	push   $0x5e
  jmp __alltraps
  1020fd:	e9 95 fc ff ff       	jmp    101d97 <__alltraps>

00102102 <vector95>:
.globl vector95
vector95:
  pushl $0
  102102:	6a 00                	push   $0x0
  pushl $95
  102104:	6a 5f                	push   $0x5f
  jmp __alltraps
  102106:	e9 8c fc ff ff       	jmp    101d97 <__alltraps>

0010210b <vector96>:
.globl vector96
vector96:
  pushl $0
  10210b:	6a 00                	push   $0x0
  pushl $96
  10210d:	6a 60                	push   $0x60
  jmp __alltraps
  10210f:	e9 83 fc ff ff       	jmp    101d97 <__alltraps>

00102114 <vector97>:
.globl vector97
vector97:
  pushl $0
  102114:	6a 00                	push   $0x0
  pushl $97
  102116:	6a 61                	push   $0x61
  jmp __alltraps
  102118:	e9 7a fc ff ff       	jmp    101d97 <__alltraps>

0010211d <vector98>:
.globl vector98
vector98:
  pushl $0
  10211d:	6a 00                	push   $0x0
  pushl $98
  10211f:	6a 62                	push   $0x62
  jmp __alltraps
  102121:	e9 71 fc ff ff       	jmp    101d97 <__alltraps>

00102126 <vector99>:
.globl vector99
vector99:
  pushl $0
  102126:	6a 00                	push   $0x0
  pushl $99
  102128:	6a 63                	push   $0x63
  jmp __alltraps
  10212a:	e9 68 fc ff ff       	jmp    101d97 <__alltraps>

0010212f <vector100>:
.globl vector100
vector100:
  pushl $0
  10212f:	6a 00                	push   $0x0
  pushl $100
  102131:	6a 64                	push   $0x64
  jmp __alltraps
  102133:	e9 5f fc ff ff       	jmp    101d97 <__alltraps>

00102138 <vector101>:
.globl vector101
vector101:
  pushl $0
  102138:	6a 00                	push   $0x0
  pushl $101
  10213a:	6a 65                	push   $0x65
  jmp __alltraps
  10213c:	e9 56 fc ff ff       	jmp    101d97 <__alltraps>

00102141 <vector102>:
.globl vector102
vector102:
  pushl $0
  102141:	6a 00                	push   $0x0
  pushl $102
  102143:	6a 66                	push   $0x66
  jmp __alltraps
  102145:	e9 4d fc ff ff       	jmp    101d97 <__alltraps>

0010214a <vector103>:
.globl vector103
vector103:
  pushl $0
  10214a:	6a 00                	push   $0x0
  pushl $103
  10214c:	6a 67                	push   $0x67
  jmp __alltraps
  10214e:	e9 44 fc ff ff       	jmp    101d97 <__alltraps>

00102153 <vector104>:
.globl vector104
vector104:
  pushl $0
  102153:	6a 00                	push   $0x0
  pushl $104
  102155:	6a 68                	push   $0x68
  jmp __alltraps
  102157:	e9 3b fc ff ff       	jmp    101d97 <__alltraps>

0010215c <vector105>:
.globl vector105
vector105:
  pushl $0
  10215c:	6a 00                	push   $0x0
  pushl $105
  10215e:	6a 69                	push   $0x69
  jmp __alltraps
  102160:	e9 32 fc ff ff       	jmp    101d97 <__alltraps>

00102165 <vector106>:
.globl vector106
vector106:
  pushl $0
  102165:	6a 00                	push   $0x0
  pushl $106
  102167:	6a 6a                	push   $0x6a
  jmp __alltraps
  102169:	e9 29 fc ff ff       	jmp    101d97 <__alltraps>

0010216e <vector107>:
.globl vector107
vector107:
  pushl $0
  10216e:	6a 00                	push   $0x0
  pushl $107
  102170:	6a 6b                	push   $0x6b
  jmp __alltraps
  102172:	e9 20 fc ff ff       	jmp    101d97 <__alltraps>

00102177 <vector108>:
.globl vector108
vector108:
  pushl $0
  102177:	6a 00                	push   $0x0
  pushl $108
  102179:	6a 6c                	push   $0x6c
  jmp __alltraps
  10217b:	e9 17 fc ff ff       	jmp    101d97 <__alltraps>

00102180 <vector109>:
.globl vector109
vector109:
  pushl $0
  102180:	6a 00                	push   $0x0
  pushl $109
  102182:	6a 6d                	push   $0x6d
  jmp __alltraps
  102184:	e9 0e fc ff ff       	jmp    101d97 <__alltraps>

00102189 <vector110>:
.globl vector110
vector110:
  pushl $0
  102189:	6a 00                	push   $0x0
  pushl $110
  10218b:	6a 6e                	push   $0x6e
  jmp __alltraps
  10218d:	e9 05 fc ff ff       	jmp    101d97 <__alltraps>

00102192 <vector111>:
.globl vector111
vector111:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $111
  102194:	6a 6f                	push   $0x6f
  jmp __alltraps
  102196:	e9 fc fb ff ff       	jmp    101d97 <__alltraps>

0010219b <vector112>:
.globl vector112
vector112:
  pushl $0
  10219b:	6a 00                	push   $0x0
  pushl $112
  10219d:	6a 70                	push   $0x70
  jmp __alltraps
  10219f:	e9 f3 fb ff ff       	jmp    101d97 <__alltraps>

001021a4 <vector113>:
.globl vector113
vector113:
  pushl $0
  1021a4:	6a 00                	push   $0x0
  pushl $113
  1021a6:	6a 71                	push   $0x71
  jmp __alltraps
  1021a8:	e9 ea fb ff ff       	jmp    101d97 <__alltraps>

001021ad <vector114>:
.globl vector114
vector114:
  pushl $0
  1021ad:	6a 00                	push   $0x0
  pushl $114
  1021af:	6a 72                	push   $0x72
  jmp __alltraps
  1021b1:	e9 e1 fb ff ff       	jmp    101d97 <__alltraps>

001021b6 <vector115>:
.globl vector115
vector115:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $115
  1021b8:	6a 73                	push   $0x73
  jmp __alltraps
  1021ba:	e9 d8 fb ff ff       	jmp    101d97 <__alltraps>

001021bf <vector116>:
.globl vector116
vector116:
  pushl $0
  1021bf:	6a 00                	push   $0x0
  pushl $116
  1021c1:	6a 74                	push   $0x74
  jmp __alltraps
  1021c3:	e9 cf fb ff ff       	jmp    101d97 <__alltraps>

001021c8 <vector117>:
.globl vector117
vector117:
  pushl $0
  1021c8:	6a 00                	push   $0x0
  pushl $117
  1021ca:	6a 75                	push   $0x75
  jmp __alltraps
  1021cc:	e9 c6 fb ff ff       	jmp    101d97 <__alltraps>

001021d1 <vector118>:
.globl vector118
vector118:
  pushl $0
  1021d1:	6a 00                	push   $0x0
  pushl $118
  1021d3:	6a 76                	push   $0x76
  jmp __alltraps
  1021d5:	e9 bd fb ff ff       	jmp    101d97 <__alltraps>

001021da <vector119>:
.globl vector119
vector119:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $119
  1021dc:	6a 77                	push   $0x77
  jmp __alltraps
  1021de:	e9 b4 fb ff ff       	jmp    101d97 <__alltraps>

001021e3 <vector120>:
.globl vector120
vector120:
  pushl $0
  1021e3:	6a 00                	push   $0x0
  pushl $120
  1021e5:	6a 78                	push   $0x78
  jmp __alltraps
  1021e7:	e9 ab fb ff ff       	jmp    101d97 <__alltraps>

001021ec <vector121>:
.globl vector121
vector121:
  pushl $0
  1021ec:	6a 00                	push   $0x0
  pushl $121
  1021ee:	6a 79                	push   $0x79
  jmp __alltraps
  1021f0:	e9 a2 fb ff ff       	jmp    101d97 <__alltraps>

001021f5 <vector122>:
.globl vector122
vector122:
  pushl $0
  1021f5:	6a 00                	push   $0x0
  pushl $122
  1021f7:	6a 7a                	push   $0x7a
  jmp __alltraps
  1021f9:	e9 99 fb ff ff       	jmp    101d97 <__alltraps>

001021fe <vector123>:
.globl vector123
vector123:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $123
  102200:	6a 7b                	push   $0x7b
  jmp __alltraps
  102202:	e9 90 fb ff ff       	jmp    101d97 <__alltraps>

00102207 <vector124>:
.globl vector124
vector124:
  pushl $0
  102207:	6a 00                	push   $0x0
  pushl $124
  102209:	6a 7c                	push   $0x7c
  jmp __alltraps
  10220b:	e9 87 fb ff ff       	jmp    101d97 <__alltraps>

00102210 <vector125>:
.globl vector125
vector125:
  pushl $0
  102210:	6a 00                	push   $0x0
  pushl $125
  102212:	6a 7d                	push   $0x7d
  jmp __alltraps
  102214:	e9 7e fb ff ff       	jmp    101d97 <__alltraps>

00102219 <vector126>:
.globl vector126
vector126:
  pushl $0
  102219:	6a 00                	push   $0x0
  pushl $126
  10221b:	6a 7e                	push   $0x7e
  jmp __alltraps
  10221d:	e9 75 fb ff ff       	jmp    101d97 <__alltraps>

00102222 <vector127>:
.globl vector127
vector127:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $127
  102224:	6a 7f                	push   $0x7f
  jmp __alltraps
  102226:	e9 6c fb ff ff       	jmp    101d97 <__alltraps>

0010222b <vector128>:
.globl vector128
vector128:
  pushl $0
  10222b:	6a 00                	push   $0x0
  pushl $128
  10222d:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102232:	e9 60 fb ff ff       	jmp    101d97 <__alltraps>

00102237 <vector129>:
.globl vector129
vector129:
  pushl $0
  102237:	6a 00                	push   $0x0
  pushl $129
  102239:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10223e:	e9 54 fb ff ff       	jmp    101d97 <__alltraps>

00102243 <vector130>:
.globl vector130
vector130:
  pushl $0
  102243:	6a 00                	push   $0x0
  pushl $130
  102245:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10224a:	e9 48 fb ff ff       	jmp    101d97 <__alltraps>

0010224f <vector131>:
.globl vector131
vector131:
  pushl $0
  10224f:	6a 00                	push   $0x0
  pushl $131
  102251:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102256:	e9 3c fb ff ff       	jmp    101d97 <__alltraps>

0010225b <vector132>:
.globl vector132
vector132:
  pushl $0
  10225b:	6a 00                	push   $0x0
  pushl $132
  10225d:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102262:	e9 30 fb ff ff       	jmp    101d97 <__alltraps>

00102267 <vector133>:
.globl vector133
vector133:
  pushl $0
  102267:	6a 00                	push   $0x0
  pushl $133
  102269:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10226e:	e9 24 fb ff ff       	jmp    101d97 <__alltraps>

00102273 <vector134>:
.globl vector134
vector134:
  pushl $0
  102273:	6a 00                	push   $0x0
  pushl $134
  102275:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10227a:	e9 18 fb ff ff       	jmp    101d97 <__alltraps>

0010227f <vector135>:
.globl vector135
vector135:
  pushl $0
  10227f:	6a 00                	push   $0x0
  pushl $135
  102281:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102286:	e9 0c fb ff ff       	jmp    101d97 <__alltraps>

0010228b <vector136>:
.globl vector136
vector136:
  pushl $0
  10228b:	6a 00                	push   $0x0
  pushl $136
  10228d:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102292:	e9 00 fb ff ff       	jmp    101d97 <__alltraps>

00102297 <vector137>:
.globl vector137
vector137:
  pushl $0
  102297:	6a 00                	push   $0x0
  pushl $137
  102299:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10229e:	e9 f4 fa ff ff       	jmp    101d97 <__alltraps>

001022a3 <vector138>:
.globl vector138
vector138:
  pushl $0
  1022a3:	6a 00                	push   $0x0
  pushl $138
  1022a5:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1022aa:	e9 e8 fa ff ff       	jmp    101d97 <__alltraps>

001022af <vector139>:
.globl vector139
vector139:
  pushl $0
  1022af:	6a 00                	push   $0x0
  pushl $139
  1022b1:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1022b6:	e9 dc fa ff ff       	jmp    101d97 <__alltraps>

001022bb <vector140>:
.globl vector140
vector140:
  pushl $0
  1022bb:	6a 00                	push   $0x0
  pushl $140
  1022bd:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1022c2:	e9 d0 fa ff ff       	jmp    101d97 <__alltraps>

001022c7 <vector141>:
.globl vector141
vector141:
  pushl $0
  1022c7:	6a 00                	push   $0x0
  pushl $141
  1022c9:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1022ce:	e9 c4 fa ff ff       	jmp    101d97 <__alltraps>

001022d3 <vector142>:
.globl vector142
vector142:
  pushl $0
  1022d3:	6a 00                	push   $0x0
  pushl $142
  1022d5:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1022da:	e9 b8 fa ff ff       	jmp    101d97 <__alltraps>

001022df <vector143>:
.globl vector143
vector143:
  pushl $0
  1022df:	6a 00                	push   $0x0
  pushl $143
  1022e1:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1022e6:	e9 ac fa ff ff       	jmp    101d97 <__alltraps>

001022eb <vector144>:
.globl vector144
vector144:
  pushl $0
  1022eb:	6a 00                	push   $0x0
  pushl $144
  1022ed:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1022f2:	e9 a0 fa ff ff       	jmp    101d97 <__alltraps>

001022f7 <vector145>:
.globl vector145
vector145:
  pushl $0
  1022f7:	6a 00                	push   $0x0
  pushl $145
  1022f9:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1022fe:	e9 94 fa ff ff       	jmp    101d97 <__alltraps>

00102303 <vector146>:
.globl vector146
vector146:
  pushl $0
  102303:	6a 00                	push   $0x0
  pushl $146
  102305:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10230a:	e9 88 fa ff ff       	jmp    101d97 <__alltraps>

0010230f <vector147>:
.globl vector147
vector147:
  pushl $0
  10230f:	6a 00                	push   $0x0
  pushl $147
  102311:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102316:	e9 7c fa ff ff       	jmp    101d97 <__alltraps>

0010231b <vector148>:
.globl vector148
vector148:
  pushl $0
  10231b:	6a 00                	push   $0x0
  pushl $148
  10231d:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102322:	e9 70 fa ff ff       	jmp    101d97 <__alltraps>

00102327 <vector149>:
.globl vector149
vector149:
  pushl $0
  102327:	6a 00                	push   $0x0
  pushl $149
  102329:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10232e:	e9 64 fa ff ff       	jmp    101d97 <__alltraps>

00102333 <vector150>:
.globl vector150
vector150:
  pushl $0
  102333:	6a 00                	push   $0x0
  pushl $150
  102335:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10233a:	e9 58 fa ff ff       	jmp    101d97 <__alltraps>

0010233f <vector151>:
.globl vector151
vector151:
  pushl $0
  10233f:	6a 00                	push   $0x0
  pushl $151
  102341:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102346:	e9 4c fa ff ff       	jmp    101d97 <__alltraps>

0010234b <vector152>:
.globl vector152
vector152:
  pushl $0
  10234b:	6a 00                	push   $0x0
  pushl $152
  10234d:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102352:	e9 40 fa ff ff       	jmp    101d97 <__alltraps>

00102357 <vector153>:
.globl vector153
vector153:
  pushl $0
  102357:	6a 00                	push   $0x0
  pushl $153
  102359:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10235e:	e9 34 fa ff ff       	jmp    101d97 <__alltraps>

00102363 <vector154>:
.globl vector154
vector154:
  pushl $0
  102363:	6a 00                	push   $0x0
  pushl $154
  102365:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10236a:	e9 28 fa ff ff       	jmp    101d97 <__alltraps>

0010236f <vector155>:
.globl vector155
vector155:
  pushl $0
  10236f:	6a 00                	push   $0x0
  pushl $155
  102371:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102376:	e9 1c fa ff ff       	jmp    101d97 <__alltraps>

0010237b <vector156>:
.globl vector156
vector156:
  pushl $0
  10237b:	6a 00                	push   $0x0
  pushl $156
  10237d:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102382:	e9 10 fa ff ff       	jmp    101d97 <__alltraps>

00102387 <vector157>:
.globl vector157
vector157:
  pushl $0
  102387:	6a 00                	push   $0x0
  pushl $157
  102389:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10238e:	e9 04 fa ff ff       	jmp    101d97 <__alltraps>

00102393 <vector158>:
.globl vector158
vector158:
  pushl $0
  102393:	6a 00                	push   $0x0
  pushl $158
  102395:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10239a:	e9 f8 f9 ff ff       	jmp    101d97 <__alltraps>

0010239f <vector159>:
.globl vector159
vector159:
  pushl $0
  10239f:	6a 00                	push   $0x0
  pushl $159
  1023a1:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1023a6:	e9 ec f9 ff ff       	jmp    101d97 <__alltraps>

001023ab <vector160>:
.globl vector160
vector160:
  pushl $0
  1023ab:	6a 00                	push   $0x0
  pushl $160
  1023ad:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1023b2:	e9 e0 f9 ff ff       	jmp    101d97 <__alltraps>

001023b7 <vector161>:
.globl vector161
vector161:
  pushl $0
  1023b7:	6a 00                	push   $0x0
  pushl $161
  1023b9:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1023be:	e9 d4 f9 ff ff       	jmp    101d97 <__alltraps>

001023c3 <vector162>:
.globl vector162
vector162:
  pushl $0
  1023c3:	6a 00                	push   $0x0
  pushl $162
  1023c5:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1023ca:	e9 c8 f9 ff ff       	jmp    101d97 <__alltraps>

001023cf <vector163>:
.globl vector163
vector163:
  pushl $0
  1023cf:	6a 00                	push   $0x0
  pushl $163
  1023d1:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1023d6:	e9 bc f9 ff ff       	jmp    101d97 <__alltraps>

001023db <vector164>:
.globl vector164
vector164:
  pushl $0
  1023db:	6a 00                	push   $0x0
  pushl $164
  1023dd:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1023e2:	e9 b0 f9 ff ff       	jmp    101d97 <__alltraps>

001023e7 <vector165>:
.globl vector165
vector165:
  pushl $0
  1023e7:	6a 00                	push   $0x0
  pushl $165
  1023e9:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1023ee:	e9 a4 f9 ff ff       	jmp    101d97 <__alltraps>

001023f3 <vector166>:
.globl vector166
vector166:
  pushl $0
  1023f3:	6a 00                	push   $0x0
  pushl $166
  1023f5:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1023fa:	e9 98 f9 ff ff       	jmp    101d97 <__alltraps>

001023ff <vector167>:
.globl vector167
vector167:
  pushl $0
  1023ff:	6a 00                	push   $0x0
  pushl $167
  102401:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102406:	e9 8c f9 ff ff       	jmp    101d97 <__alltraps>

0010240b <vector168>:
.globl vector168
vector168:
  pushl $0
  10240b:	6a 00                	push   $0x0
  pushl $168
  10240d:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102412:	e9 80 f9 ff ff       	jmp    101d97 <__alltraps>

00102417 <vector169>:
.globl vector169
vector169:
  pushl $0
  102417:	6a 00                	push   $0x0
  pushl $169
  102419:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10241e:	e9 74 f9 ff ff       	jmp    101d97 <__alltraps>

00102423 <vector170>:
.globl vector170
vector170:
  pushl $0
  102423:	6a 00                	push   $0x0
  pushl $170
  102425:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10242a:	e9 68 f9 ff ff       	jmp    101d97 <__alltraps>

0010242f <vector171>:
.globl vector171
vector171:
  pushl $0
  10242f:	6a 00                	push   $0x0
  pushl $171
  102431:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102436:	e9 5c f9 ff ff       	jmp    101d97 <__alltraps>

0010243b <vector172>:
.globl vector172
vector172:
  pushl $0
  10243b:	6a 00                	push   $0x0
  pushl $172
  10243d:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102442:	e9 50 f9 ff ff       	jmp    101d97 <__alltraps>

00102447 <vector173>:
.globl vector173
vector173:
  pushl $0
  102447:	6a 00                	push   $0x0
  pushl $173
  102449:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10244e:	e9 44 f9 ff ff       	jmp    101d97 <__alltraps>

00102453 <vector174>:
.globl vector174
vector174:
  pushl $0
  102453:	6a 00                	push   $0x0
  pushl $174
  102455:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10245a:	e9 38 f9 ff ff       	jmp    101d97 <__alltraps>

0010245f <vector175>:
.globl vector175
vector175:
  pushl $0
  10245f:	6a 00                	push   $0x0
  pushl $175
  102461:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102466:	e9 2c f9 ff ff       	jmp    101d97 <__alltraps>

0010246b <vector176>:
.globl vector176
vector176:
  pushl $0
  10246b:	6a 00                	push   $0x0
  pushl $176
  10246d:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102472:	e9 20 f9 ff ff       	jmp    101d97 <__alltraps>

00102477 <vector177>:
.globl vector177
vector177:
  pushl $0
  102477:	6a 00                	push   $0x0
  pushl $177
  102479:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10247e:	e9 14 f9 ff ff       	jmp    101d97 <__alltraps>

00102483 <vector178>:
.globl vector178
vector178:
  pushl $0
  102483:	6a 00                	push   $0x0
  pushl $178
  102485:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10248a:	e9 08 f9 ff ff       	jmp    101d97 <__alltraps>

0010248f <vector179>:
.globl vector179
vector179:
  pushl $0
  10248f:	6a 00                	push   $0x0
  pushl $179
  102491:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102496:	e9 fc f8 ff ff       	jmp    101d97 <__alltraps>

0010249b <vector180>:
.globl vector180
vector180:
  pushl $0
  10249b:	6a 00                	push   $0x0
  pushl $180
  10249d:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1024a2:	e9 f0 f8 ff ff       	jmp    101d97 <__alltraps>

001024a7 <vector181>:
.globl vector181
vector181:
  pushl $0
  1024a7:	6a 00                	push   $0x0
  pushl $181
  1024a9:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1024ae:	e9 e4 f8 ff ff       	jmp    101d97 <__alltraps>

001024b3 <vector182>:
.globl vector182
vector182:
  pushl $0
  1024b3:	6a 00                	push   $0x0
  pushl $182
  1024b5:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1024ba:	e9 d8 f8 ff ff       	jmp    101d97 <__alltraps>

001024bf <vector183>:
.globl vector183
vector183:
  pushl $0
  1024bf:	6a 00                	push   $0x0
  pushl $183
  1024c1:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1024c6:	e9 cc f8 ff ff       	jmp    101d97 <__alltraps>

001024cb <vector184>:
.globl vector184
vector184:
  pushl $0
  1024cb:	6a 00                	push   $0x0
  pushl $184
  1024cd:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1024d2:	e9 c0 f8 ff ff       	jmp    101d97 <__alltraps>

001024d7 <vector185>:
.globl vector185
vector185:
  pushl $0
  1024d7:	6a 00                	push   $0x0
  pushl $185
  1024d9:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1024de:	e9 b4 f8 ff ff       	jmp    101d97 <__alltraps>

001024e3 <vector186>:
.globl vector186
vector186:
  pushl $0
  1024e3:	6a 00                	push   $0x0
  pushl $186
  1024e5:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1024ea:	e9 a8 f8 ff ff       	jmp    101d97 <__alltraps>

001024ef <vector187>:
.globl vector187
vector187:
  pushl $0
  1024ef:	6a 00                	push   $0x0
  pushl $187
  1024f1:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1024f6:	e9 9c f8 ff ff       	jmp    101d97 <__alltraps>

001024fb <vector188>:
.globl vector188
vector188:
  pushl $0
  1024fb:	6a 00                	push   $0x0
  pushl $188
  1024fd:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102502:	e9 90 f8 ff ff       	jmp    101d97 <__alltraps>

00102507 <vector189>:
.globl vector189
vector189:
  pushl $0
  102507:	6a 00                	push   $0x0
  pushl $189
  102509:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10250e:	e9 84 f8 ff ff       	jmp    101d97 <__alltraps>

00102513 <vector190>:
.globl vector190
vector190:
  pushl $0
  102513:	6a 00                	push   $0x0
  pushl $190
  102515:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10251a:	e9 78 f8 ff ff       	jmp    101d97 <__alltraps>

0010251f <vector191>:
.globl vector191
vector191:
  pushl $0
  10251f:	6a 00                	push   $0x0
  pushl $191
  102521:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102526:	e9 6c f8 ff ff       	jmp    101d97 <__alltraps>

0010252b <vector192>:
.globl vector192
vector192:
  pushl $0
  10252b:	6a 00                	push   $0x0
  pushl $192
  10252d:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102532:	e9 60 f8 ff ff       	jmp    101d97 <__alltraps>

00102537 <vector193>:
.globl vector193
vector193:
  pushl $0
  102537:	6a 00                	push   $0x0
  pushl $193
  102539:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10253e:	e9 54 f8 ff ff       	jmp    101d97 <__alltraps>

00102543 <vector194>:
.globl vector194
vector194:
  pushl $0
  102543:	6a 00                	push   $0x0
  pushl $194
  102545:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10254a:	e9 48 f8 ff ff       	jmp    101d97 <__alltraps>

0010254f <vector195>:
.globl vector195
vector195:
  pushl $0
  10254f:	6a 00                	push   $0x0
  pushl $195
  102551:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102556:	e9 3c f8 ff ff       	jmp    101d97 <__alltraps>

0010255b <vector196>:
.globl vector196
vector196:
  pushl $0
  10255b:	6a 00                	push   $0x0
  pushl $196
  10255d:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102562:	e9 30 f8 ff ff       	jmp    101d97 <__alltraps>

00102567 <vector197>:
.globl vector197
vector197:
  pushl $0
  102567:	6a 00                	push   $0x0
  pushl $197
  102569:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10256e:	e9 24 f8 ff ff       	jmp    101d97 <__alltraps>

00102573 <vector198>:
.globl vector198
vector198:
  pushl $0
  102573:	6a 00                	push   $0x0
  pushl $198
  102575:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10257a:	e9 18 f8 ff ff       	jmp    101d97 <__alltraps>

0010257f <vector199>:
.globl vector199
vector199:
  pushl $0
  10257f:	6a 00                	push   $0x0
  pushl $199
  102581:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102586:	e9 0c f8 ff ff       	jmp    101d97 <__alltraps>

0010258b <vector200>:
.globl vector200
vector200:
  pushl $0
  10258b:	6a 00                	push   $0x0
  pushl $200
  10258d:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102592:	e9 00 f8 ff ff       	jmp    101d97 <__alltraps>

00102597 <vector201>:
.globl vector201
vector201:
  pushl $0
  102597:	6a 00                	push   $0x0
  pushl $201
  102599:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10259e:	e9 f4 f7 ff ff       	jmp    101d97 <__alltraps>

001025a3 <vector202>:
.globl vector202
vector202:
  pushl $0
  1025a3:	6a 00                	push   $0x0
  pushl $202
  1025a5:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1025aa:	e9 e8 f7 ff ff       	jmp    101d97 <__alltraps>

001025af <vector203>:
.globl vector203
vector203:
  pushl $0
  1025af:	6a 00                	push   $0x0
  pushl $203
  1025b1:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1025b6:	e9 dc f7 ff ff       	jmp    101d97 <__alltraps>

001025bb <vector204>:
.globl vector204
vector204:
  pushl $0
  1025bb:	6a 00                	push   $0x0
  pushl $204
  1025bd:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1025c2:	e9 d0 f7 ff ff       	jmp    101d97 <__alltraps>

001025c7 <vector205>:
.globl vector205
vector205:
  pushl $0
  1025c7:	6a 00                	push   $0x0
  pushl $205
  1025c9:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1025ce:	e9 c4 f7 ff ff       	jmp    101d97 <__alltraps>

001025d3 <vector206>:
.globl vector206
vector206:
  pushl $0
  1025d3:	6a 00                	push   $0x0
  pushl $206
  1025d5:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1025da:	e9 b8 f7 ff ff       	jmp    101d97 <__alltraps>

001025df <vector207>:
.globl vector207
vector207:
  pushl $0
  1025df:	6a 00                	push   $0x0
  pushl $207
  1025e1:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1025e6:	e9 ac f7 ff ff       	jmp    101d97 <__alltraps>

001025eb <vector208>:
.globl vector208
vector208:
  pushl $0
  1025eb:	6a 00                	push   $0x0
  pushl $208
  1025ed:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1025f2:	e9 a0 f7 ff ff       	jmp    101d97 <__alltraps>

001025f7 <vector209>:
.globl vector209
vector209:
  pushl $0
  1025f7:	6a 00                	push   $0x0
  pushl $209
  1025f9:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1025fe:	e9 94 f7 ff ff       	jmp    101d97 <__alltraps>

00102603 <vector210>:
.globl vector210
vector210:
  pushl $0
  102603:	6a 00                	push   $0x0
  pushl $210
  102605:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10260a:	e9 88 f7 ff ff       	jmp    101d97 <__alltraps>

0010260f <vector211>:
.globl vector211
vector211:
  pushl $0
  10260f:	6a 00                	push   $0x0
  pushl $211
  102611:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102616:	e9 7c f7 ff ff       	jmp    101d97 <__alltraps>

0010261b <vector212>:
.globl vector212
vector212:
  pushl $0
  10261b:	6a 00                	push   $0x0
  pushl $212
  10261d:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102622:	e9 70 f7 ff ff       	jmp    101d97 <__alltraps>

00102627 <vector213>:
.globl vector213
vector213:
  pushl $0
  102627:	6a 00                	push   $0x0
  pushl $213
  102629:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10262e:	e9 64 f7 ff ff       	jmp    101d97 <__alltraps>

00102633 <vector214>:
.globl vector214
vector214:
  pushl $0
  102633:	6a 00                	push   $0x0
  pushl $214
  102635:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10263a:	e9 58 f7 ff ff       	jmp    101d97 <__alltraps>

0010263f <vector215>:
.globl vector215
vector215:
  pushl $0
  10263f:	6a 00                	push   $0x0
  pushl $215
  102641:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102646:	e9 4c f7 ff ff       	jmp    101d97 <__alltraps>

0010264b <vector216>:
.globl vector216
vector216:
  pushl $0
  10264b:	6a 00                	push   $0x0
  pushl $216
  10264d:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102652:	e9 40 f7 ff ff       	jmp    101d97 <__alltraps>

00102657 <vector217>:
.globl vector217
vector217:
  pushl $0
  102657:	6a 00                	push   $0x0
  pushl $217
  102659:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10265e:	e9 34 f7 ff ff       	jmp    101d97 <__alltraps>

00102663 <vector218>:
.globl vector218
vector218:
  pushl $0
  102663:	6a 00                	push   $0x0
  pushl $218
  102665:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10266a:	e9 28 f7 ff ff       	jmp    101d97 <__alltraps>

0010266f <vector219>:
.globl vector219
vector219:
  pushl $0
  10266f:	6a 00                	push   $0x0
  pushl $219
  102671:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102676:	e9 1c f7 ff ff       	jmp    101d97 <__alltraps>

0010267b <vector220>:
.globl vector220
vector220:
  pushl $0
  10267b:	6a 00                	push   $0x0
  pushl $220
  10267d:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102682:	e9 10 f7 ff ff       	jmp    101d97 <__alltraps>

00102687 <vector221>:
.globl vector221
vector221:
  pushl $0
  102687:	6a 00                	push   $0x0
  pushl $221
  102689:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10268e:	e9 04 f7 ff ff       	jmp    101d97 <__alltraps>

00102693 <vector222>:
.globl vector222
vector222:
  pushl $0
  102693:	6a 00                	push   $0x0
  pushl $222
  102695:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10269a:	e9 f8 f6 ff ff       	jmp    101d97 <__alltraps>

0010269f <vector223>:
.globl vector223
vector223:
  pushl $0
  10269f:	6a 00                	push   $0x0
  pushl $223
  1026a1:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1026a6:	e9 ec f6 ff ff       	jmp    101d97 <__alltraps>

001026ab <vector224>:
.globl vector224
vector224:
  pushl $0
  1026ab:	6a 00                	push   $0x0
  pushl $224
  1026ad:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1026b2:	e9 e0 f6 ff ff       	jmp    101d97 <__alltraps>

001026b7 <vector225>:
.globl vector225
vector225:
  pushl $0
  1026b7:	6a 00                	push   $0x0
  pushl $225
  1026b9:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1026be:	e9 d4 f6 ff ff       	jmp    101d97 <__alltraps>

001026c3 <vector226>:
.globl vector226
vector226:
  pushl $0
  1026c3:	6a 00                	push   $0x0
  pushl $226
  1026c5:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1026ca:	e9 c8 f6 ff ff       	jmp    101d97 <__alltraps>

001026cf <vector227>:
.globl vector227
vector227:
  pushl $0
  1026cf:	6a 00                	push   $0x0
  pushl $227
  1026d1:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1026d6:	e9 bc f6 ff ff       	jmp    101d97 <__alltraps>

001026db <vector228>:
.globl vector228
vector228:
  pushl $0
  1026db:	6a 00                	push   $0x0
  pushl $228
  1026dd:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1026e2:	e9 b0 f6 ff ff       	jmp    101d97 <__alltraps>

001026e7 <vector229>:
.globl vector229
vector229:
  pushl $0
  1026e7:	6a 00                	push   $0x0
  pushl $229
  1026e9:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1026ee:	e9 a4 f6 ff ff       	jmp    101d97 <__alltraps>

001026f3 <vector230>:
.globl vector230
vector230:
  pushl $0
  1026f3:	6a 00                	push   $0x0
  pushl $230
  1026f5:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1026fa:	e9 98 f6 ff ff       	jmp    101d97 <__alltraps>

001026ff <vector231>:
.globl vector231
vector231:
  pushl $0
  1026ff:	6a 00                	push   $0x0
  pushl $231
  102701:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102706:	e9 8c f6 ff ff       	jmp    101d97 <__alltraps>

0010270b <vector232>:
.globl vector232
vector232:
  pushl $0
  10270b:	6a 00                	push   $0x0
  pushl $232
  10270d:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102712:	e9 80 f6 ff ff       	jmp    101d97 <__alltraps>

00102717 <vector233>:
.globl vector233
vector233:
  pushl $0
  102717:	6a 00                	push   $0x0
  pushl $233
  102719:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10271e:	e9 74 f6 ff ff       	jmp    101d97 <__alltraps>

00102723 <vector234>:
.globl vector234
vector234:
  pushl $0
  102723:	6a 00                	push   $0x0
  pushl $234
  102725:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10272a:	e9 68 f6 ff ff       	jmp    101d97 <__alltraps>

0010272f <vector235>:
.globl vector235
vector235:
  pushl $0
  10272f:	6a 00                	push   $0x0
  pushl $235
  102731:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102736:	e9 5c f6 ff ff       	jmp    101d97 <__alltraps>

0010273b <vector236>:
.globl vector236
vector236:
  pushl $0
  10273b:	6a 00                	push   $0x0
  pushl $236
  10273d:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102742:	e9 50 f6 ff ff       	jmp    101d97 <__alltraps>

00102747 <vector237>:
.globl vector237
vector237:
  pushl $0
  102747:	6a 00                	push   $0x0
  pushl $237
  102749:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10274e:	e9 44 f6 ff ff       	jmp    101d97 <__alltraps>

00102753 <vector238>:
.globl vector238
vector238:
  pushl $0
  102753:	6a 00                	push   $0x0
  pushl $238
  102755:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10275a:	e9 38 f6 ff ff       	jmp    101d97 <__alltraps>

0010275f <vector239>:
.globl vector239
vector239:
  pushl $0
  10275f:	6a 00                	push   $0x0
  pushl $239
  102761:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102766:	e9 2c f6 ff ff       	jmp    101d97 <__alltraps>

0010276b <vector240>:
.globl vector240
vector240:
  pushl $0
  10276b:	6a 00                	push   $0x0
  pushl $240
  10276d:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102772:	e9 20 f6 ff ff       	jmp    101d97 <__alltraps>

00102777 <vector241>:
.globl vector241
vector241:
  pushl $0
  102777:	6a 00                	push   $0x0
  pushl $241
  102779:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10277e:	e9 14 f6 ff ff       	jmp    101d97 <__alltraps>

00102783 <vector242>:
.globl vector242
vector242:
  pushl $0
  102783:	6a 00                	push   $0x0
  pushl $242
  102785:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10278a:	e9 08 f6 ff ff       	jmp    101d97 <__alltraps>

0010278f <vector243>:
.globl vector243
vector243:
  pushl $0
  10278f:	6a 00                	push   $0x0
  pushl $243
  102791:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102796:	e9 fc f5 ff ff       	jmp    101d97 <__alltraps>

0010279b <vector244>:
.globl vector244
vector244:
  pushl $0
  10279b:	6a 00                	push   $0x0
  pushl $244
  10279d:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1027a2:	e9 f0 f5 ff ff       	jmp    101d97 <__alltraps>

001027a7 <vector245>:
.globl vector245
vector245:
  pushl $0
  1027a7:	6a 00                	push   $0x0
  pushl $245
  1027a9:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1027ae:	e9 e4 f5 ff ff       	jmp    101d97 <__alltraps>

001027b3 <vector246>:
.globl vector246
vector246:
  pushl $0
  1027b3:	6a 00                	push   $0x0
  pushl $246
  1027b5:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1027ba:	e9 d8 f5 ff ff       	jmp    101d97 <__alltraps>

001027bf <vector247>:
.globl vector247
vector247:
  pushl $0
  1027bf:	6a 00                	push   $0x0
  pushl $247
  1027c1:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1027c6:	e9 cc f5 ff ff       	jmp    101d97 <__alltraps>

001027cb <vector248>:
.globl vector248
vector248:
  pushl $0
  1027cb:	6a 00                	push   $0x0
  pushl $248
  1027cd:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1027d2:	e9 c0 f5 ff ff       	jmp    101d97 <__alltraps>

001027d7 <vector249>:
.globl vector249
vector249:
  pushl $0
  1027d7:	6a 00                	push   $0x0
  pushl $249
  1027d9:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1027de:	e9 b4 f5 ff ff       	jmp    101d97 <__alltraps>

001027e3 <vector250>:
.globl vector250
vector250:
  pushl $0
  1027e3:	6a 00                	push   $0x0
  pushl $250
  1027e5:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1027ea:	e9 a8 f5 ff ff       	jmp    101d97 <__alltraps>

001027ef <vector251>:
.globl vector251
vector251:
  pushl $0
  1027ef:	6a 00                	push   $0x0
  pushl $251
  1027f1:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1027f6:	e9 9c f5 ff ff       	jmp    101d97 <__alltraps>

001027fb <vector252>:
.globl vector252
vector252:
  pushl $0
  1027fb:	6a 00                	push   $0x0
  pushl $252
  1027fd:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102802:	e9 90 f5 ff ff       	jmp    101d97 <__alltraps>

00102807 <vector253>:
.globl vector253
vector253:
  pushl $0
  102807:	6a 00                	push   $0x0
  pushl $253
  102809:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10280e:	e9 84 f5 ff ff       	jmp    101d97 <__alltraps>

00102813 <vector254>:
.globl vector254
vector254:
  pushl $0
  102813:	6a 00                	push   $0x0
  pushl $254
  102815:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10281a:	e9 78 f5 ff ff       	jmp    101d97 <__alltraps>

0010281f <vector255>:
.globl vector255
vector255:
  pushl $0
  10281f:	6a 00                	push   $0x0
  pushl $255
  102821:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102826:	e9 6c f5 ff ff       	jmp    101d97 <__alltraps>

0010282b <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10282b:	55                   	push   %ebp
  10282c:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10282e:	8b 45 08             	mov    0x8(%ebp),%eax
  102831:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102834:	b8 23 00 00 00       	mov    $0x23,%eax
  102839:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10283b:	b8 23 00 00 00       	mov    $0x23,%eax
  102840:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102842:	b8 10 00 00 00       	mov    $0x10,%eax
  102847:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102849:	b8 10 00 00 00       	mov    $0x10,%eax
  10284e:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102850:	b8 10 00 00 00       	mov    $0x10,%eax
  102855:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102857:	ea 5e 28 10 00 08 00 	ljmp   $0x8,$0x10285e
}
  10285e:	90                   	nop
  10285f:	5d                   	pop    %ebp
  102860:	c3                   	ret    

00102861 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102861:	55                   	push   %ebp
  102862:	89 e5                	mov    %esp,%ebp
  102864:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102867:	b8 c0 08 11 00       	mov    $0x1108c0,%eax
  10286c:	05 00 04 00 00       	add    $0x400,%eax
  102871:	a3 c4 0c 11 00       	mov    %eax,0x110cc4
    ts.ts_ss0 = KERNEL_DS;
  102876:	66 c7 05 c8 0c 11 00 	movw   $0x10,0x110cc8
  10287d:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10287f:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102886:	68 00 
  102888:	b8 c0 0c 11 00       	mov    $0x110cc0,%eax
  10288d:	0f b7 c0             	movzwl %ax,%eax
  102890:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  102896:	b8 c0 0c 11 00       	mov    $0x110cc0,%eax
  10289b:	c1 e8 10             	shr    $0x10,%eax
  10289e:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1028a3:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1028aa:	24 f0                	and    $0xf0,%al
  1028ac:	0c 09                	or     $0x9,%al
  1028ae:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1028b3:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1028ba:	0c 10                	or     $0x10,%al
  1028bc:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1028c1:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1028c8:	24 9f                	and    $0x9f,%al
  1028ca:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1028cf:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1028d6:	0c 80                	or     $0x80,%al
  1028d8:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1028dd:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1028e4:	24 f0                	and    $0xf0,%al
  1028e6:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1028eb:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1028f2:	24 ef                	and    $0xef,%al
  1028f4:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1028f9:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102900:	24 df                	and    $0xdf,%al
  102902:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102907:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10290e:	0c 40                	or     $0x40,%al
  102910:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102915:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10291c:	24 7f                	and    $0x7f,%al
  10291e:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102923:	b8 c0 0c 11 00       	mov    $0x110cc0,%eax
  102928:	c1 e8 18             	shr    $0x18,%eax
  10292b:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102930:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102937:	24 ef                	and    $0xef,%al
  102939:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  10293e:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102945:	e8 e1 fe ff ff       	call   10282b <lgdt>
  10294a:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102950:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102954:	0f 00 d8             	ltr    %ax
}
  102957:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102958:	90                   	nop
  102959:	89 ec                	mov    %ebp,%esp
  10295b:	5d                   	pop    %ebp
  10295c:	c3                   	ret    

0010295d <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10295d:	55                   	push   %ebp
  10295e:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102960:	e8 fc fe ff ff       	call   102861 <gdt_init>
}
  102965:	90                   	nop
  102966:	5d                   	pop    %ebp
  102967:	c3                   	ret    

00102968 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102968:	55                   	push   %ebp
  102969:	89 e5                	mov    %esp,%ebp
  10296b:	83 ec 58             	sub    $0x58,%esp
  10296e:	8b 45 10             	mov    0x10(%ebp),%eax
  102971:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102974:	8b 45 14             	mov    0x14(%ebp),%eax
  102977:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  10297a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10297d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102980:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102983:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102986:	8b 45 18             	mov    0x18(%ebp),%eax
  102989:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10298c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10298f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102992:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102995:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102998:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10299b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10299e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1029a2:	74 1c                	je     1029c0 <printnum+0x58>
  1029a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029a7:	ba 00 00 00 00       	mov    $0x0,%edx
  1029ac:	f7 75 e4             	divl   -0x1c(%ebp)
  1029af:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1029b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029b5:	ba 00 00 00 00       	mov    $0x0,%edx
  1029ba:	f7 75 e4             	divl   -0x1c(%ebp)
  1029bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1029c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029c3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1029c6:	f7 75 e4             	divl   -0x1c(%ebp)
  1029c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1029cc:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1029cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029d2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1029d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1029d8:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1029db:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1029de:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1029e1:	8b 45 18             	mov    0x18(%ebp),%eax
  1029e4:	ba 00 00 00 00       	mov    $0x0,%edx
  1029e9:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  1029ec:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  1029ef:	19 d1                	sbb    %edx,%ecx
  1029f1:	72 4c                	jb     102a3f <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  1029f3:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1029f6:	8d 50 ff             	lea    -0x1(%eax),%edx
  1029f9:	8b 45 20             	mov    0x20(%ebp),%eax
  1029fc:	89 44 24 18          	mov    %eax,0x18(%esp)
  102a00:	89 54 24 14          	mov    %edx,0x14(%esp)
  102a04:	8b 45 18             	mov    0x18(%ebp),%eax
  102a07:	89 44 24 10          	mov    %eax,0x10(%esp)
  102a0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a0e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102a11:	89 44 24 08          	mov    %eax,0x8(%esp)
  102a15:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102a19:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a1c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a20:	8b 45 08             	mov    0x8(%ebp),%eax
  102a23:	89 04 24             	mov    %eax,(%esp)
  102a26:	e8 3d ff ff ff       	call   102968 <printnum>
  102a2b:	eb 1b                	jmp    102a48 <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102a2d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a30:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a34:	8b 45 20             	mov    0x20(%ebp),%eax
  102a37:	89 04 24             	mov    %eax,(%esp)
  102a3a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3d:	ff d0                	call   *%eax
        while (-- width > 0)
  102a3f:	ff 4d 1c             	decl   0x1c(%ebp)
  102a42:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102a46:	7f e5                	jg     102a2d <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102a48:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102a4b:	05 70 3c 10 00       	add    $0x103c70,%eax
  102a50:	0f b6 00             	movzbl (%eax),%eax
  102a53:	0f be c0             	movsbl %al,%eax
  102a56:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a59:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a5d:	89 04 24             	mov    %eax,(%esp)
  102a60:	8b 45 08             	mov    0x8(%ebp),%eax
  102a63:	ff d0                	call   *%eax
}
  102a65:	90                   	nop
  102a66:	89 ec                	mov    %ebp,%esp
  102a68:	5d                   	pop    %ebp
  102a69:	c3                   	ret    

00102a6a <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102a6a:	55                   	push   %ebp
  102a6b:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a6d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a71:	7e 14                	jle    102a87 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102a73:	8b 45 08             	mov    0x8(%ebp),%eax
  102a76:	8b 00                	mov    (%eax),%eax
  102a78:	8d 48 08             	lea    0x8(%eax),%ecx
  102a7b:	8b 55 08             	mov    0x8(%ebp),%edx
  102a7e:	89 0a                	mov    %ecx,(%edx)
  102a80:	8b 50 04             	mov    0x4(%eax),%edx
  102a83:	8b 00                	mov    (%eax),%eax
  102a85:	eb 30                	jmp    102ab7 <getuint+0x4d>
    }
    else if (lflag) {
  102a87:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a8b:	74 16                	je     102aa3 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a90:	8b 00                	mov    (%eax),%eax
  102a92:	8d 48 04             	lea    0x4(%eax),%ecx
  102a95:	8b 55 08             	mov    0x8(%ebp),%edx
  102a98:	89 0a                	mov    %ecx,(%edx)
  102a9a:	8b 00                	mov    (%eax),%eax
  102a9c:	ba 00 00 00 00       	mov    $0x0,%edx
  102aa1:	eb 14                	jmp    102ab7 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa6:	8b 00                	mov    (%eax),%eax
  102aa8:	8d 48 04             	lea    0x4(%eax),%ecx
  102aab:	8b 55 08             	mov    0x8(%ebp),%edx
  102aae:	89 0a                	mov    %ecx,(%edx)
  102ab0:	8b 00                	mov    (%eax),%eax
  102ab2:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102ab7:	5d                   	pop    %ebp
  102ab8:	c3                   	ret    

00102ab9 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102ab9:	55                   	push   %ebp
  102aba:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102abc:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102ac0:	7e 14                	jle    102ad6 <getint+0x1d>
        return va_arg(*ap, long long);
  102ac2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac5:	8b 00                	mov    (%eax),%eax
  102ac7:	8d 48 08             	lea    0x8(%eax),%ecx
  102aca:	8b 55 08             	mov    0x8(%ebp),%edx
  102acd:	89 0a                	mov    %ecx,(%edx)
  102acf:	8b 50 04             	mov    0x4(%eax),%edx
  102ad2:	8b 00                	mov    (%eax),%eax
  102ad4:	eb 28                	jmp    102afe <getint+0x45>
    }
    else if (lflag) {
  102ad6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ada:	74 12                	je     102aee <getint+0x35>
        return va_arg(*ap, long);
  102adc:	8b 45 08             	mov    0x8(%ebp),%eax
  102adf:	8b 00                	mov    (%eax),%eax
  102ae1:	8d 48 04             	lea    0x4(%eax),%ecx
  102ae4:	8b 55 08             	mov    0x8(%ebp),%edx
  102ae7:	89 0a                	mov    %ecx,(%edx)
  102ae9:	8b 00                	mov    (%eax),%eax
  102aeb:	99                   	cltd   
  102aec:	eb 10                	jmp    102afe <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102aee:	8b 45 08             	mov    0x8(%ebp),%eax
  102af1:	8b 00                	mov    (%eax),%eax
  102af3:	8d 48 04             	lea    0x4(%eax),%ecx
  102af6:	8b 55 08             	mov    0x8(%ebp),%edx
  102af9:	89 0a                	mov    %ecx,(%edx)
  102afb:	8b 00                	mov    (%eax),%eax
  102afd:	99                   	cltd   
    }
}
  102afe:	5d                   	pop    %ebp
  102aff:	c3                   	ret    

00102b00 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102b00:	55                   	push   %ebp
  102b01:	89 e5                	mov    %esp,%ebp
  102b03:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102b06:	8d 45 14             	lea    0x14(%ebp),%eax
  102b09:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102b0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b0f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102b13:	8b 45 10             	mov    0x10(%ebp),%eax
  102b16:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b1a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b1d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b21:	8b 45 08             	mov    0x8(%ebp),%eax
  102b24:	89 04 24             	mov    %eax,(%esp)
  102b27:	e8 05 00 00 00       	call   102b31 <vprintfmt>
    va_end(ap);
}
  102b2c:	90                   	nop
  102b2d:	89 ec                	mov    %ebp,%esp
  102b2f:	5d                   	pop    %ebp
  102b30:	c3                   	ret    

00102b31 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102b31:	55                   	push   %ebp
  102b32:	89 e5                	mov    %esp,%ebp
  102b34:	56                   	push   %esi
  102b35:	53                   	push   %ebx
  102b36:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b39:	eb 17                	jmp    102b52 <vprintfmt+0x21>
            if (ch == '\0') {
  102b3b:	85 db                	test   %ebx,%ebx
  102b3d:	0f 84 bf 03 00 00    	je     102f02 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102b43:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b46:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b4a:	89 1c 24             	mov    %ebx,(%esp)
  102b4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102b50:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b52:	8b 45 10             	mov    0x10(%ebp),%eax
  102b55:	8d 50 01             	lea    0x1(%eax),%edx
  102b58:	89 55 10             	mov    %edx,0x10(%ebp)
  102b5b:	0f b6 00             	movzbl (%eax),%eax
  102b5e:	0f b6 d8             	movzbl %al,%ebx
  102b61:	83 fb 25             	cmp    $0x25,%ebx
  102b64:	75 d5                	jne    102b3b <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102b66:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102b6a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102b71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b74:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102b77:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102b7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b81:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102b84:	8b 45 10             	mov    0x10(%ebp),%eax
  102b87:	8d 50 01             	lea    0x1(%eax),%edx
  102b8a:	89 55 10             	mov    %edx,0x10(%ebp)
  102b8d:	0f b6 00             	movzbl (%eax),%eax
  102b90:	0f b6 d8             	movzbl %al,%ebx
  102b93:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102b96:	83 f8 55             	cmp    $0x55,%eax
  102b99:	0f 87 37 03 00 00    	ja     102ed6 <vprintfmt+0x3a5>
  102b9f:	8b 04 85 94 3c 10 00 	mov    0x103c94(,%eax,4),%eax
  102ba6:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102ba8:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102bac:	eb d6                	jmp    102b84 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102bae:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102bb2:	eb d0                	jmp    102b84 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102bb4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102bbb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102bbe:	89 d0                	mov    %edx,%eax
  102bc0:	c1 e0 02             	shl    $0x2,%eax
  102bc3:	01 d0                	add    %edx,%eax
  102bc5:	01 c0                	add    %eax,%eax
  102bc7:	01 d8                	add    %ebx,%eax
  102bc9:	83 e8 30             	sub    $0x30,%eax
  102bcc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102bcf:	8b 45 10             	mov    0x10(%ebp),%eax
  102bd2:	0f b6 00             	movzbl (%eax),%eax
  102bd5:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102bd8:	83 fb 2f             	cmp    $0x2f,%ebx
  102bdb:	7e 38                	jle    102c15 <vprintfmt+0xe4>
  102bdd:	83 fb 39             	cmp    $0x39,%ebx
  102be0:	7f 33                	jg     102c15 <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102be2:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102be5:	eb d4                	jmp    102bbb <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102be7:	8b 45 14             	mov    0x14(%ebp),%eax
  102bea:	8d 50 04             	lea    0x4(%eax),%edx
  102bed:	89 55 14             	mov    %edx,0x14(%ebp)
  102bf0:	8b 00                	mov    (%eax),%eax
  102bf2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102bf5:	eb 1f                	jmp    102c16 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102bf7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bfb:	79 87                	jns    102b84 <vprintfmt+0x53>
                width = 0;
  102bfd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102c04:	e9 7b ff ff ff       	jmp    102b84 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102c09:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102c10:	e9 6f ff ff ff       	jmp    102b84 <vprintfmt+0x53>
            goto process_precision;
  102c15:	90                   	nop

        process_precision:
            if (width < 0)
  102c16:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c1a:	0f 89 64 ff ff ff    	jns    102b84 <vprintfmt+0x53>
                width = precision, precision = -1;
  102c20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c23:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c26:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102c2d:	e9 52 ff ff ff       	jmp    102b84 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102c32:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102c35:	e9 4a ff ff ff       	jmp    102b84 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102c3a:	8b 45 14             	mov    0x14(%ebp),%eax
  102c3d:	8d 50 04             	lea    0x4(%eax),%edx
  102c40:	89 55 14             	mov    %edx,0x14(%ebp)
  102c43:	8b 00                	mov    (%eax),%eax
  102c45:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c48:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c4c:	89 04 24             	mov    %eax,(%esp)
  102c4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c52:	ff d0                	call   *%eax
            break;
  102c54:	e9 a4 02 00 00       	jmp    102efd <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102c59:	8b 45 14             	mov    0x14(%ebp),%eax
  102c5c:	8d 50 04             	lea    0x4(%eax),%edx
  102c5f:	89 55 14             	mov    %edx,0x14(%ebp)
  102c62:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102c64:	85 db                	test   %ebx,%ebx
  102c66:	79 02                	jns    102c6a <vprintfmt+0x139>
                err = -err;
  102c68:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102c6a:	83 fb 06             	cmp    $0x6,%ebx
  102c6d:	7f 0b                	jg     102c7a <vprintfmt+0x149>
  102c6f:	8b 34 9d 54 3c 10 00 	mov    0x103c54(,%ebx,4),%esi
  102c76:	85 f6                	test   %esi,%esi
  102c78:	75 23                	jne    102c9d <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102c7a:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102c7e:	c7 44 24 08 81 3c 10 	movl   $0x103c81,0x8(%esp)
  102c85:	00 
  102c86:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c89:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c90:	89 04 24             	mov    %eax,(%esp)
  102c93:	e8 68 fe ff ff       	call   102b00 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102c98:	e9 60 02 00 00       	jmp    102efd <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102c9d:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102ca1:	c7 44 24 08 8a 3c 10 	movl   $0x103c8a,0x8(%esp)
  102ca8:	00 
  102ca9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cac:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cb0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb3:	89 04 24             	mov    %eax,(%esp)
  102cb6:	e8 45 fe ff ff       	call   102b00 <printfmt>
            break;
  102cbb:	e9 3d 02 00 00       	jmp    102efd <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102cc0:	8b 45 14             	mov    0x14(%ebp),%eax
  102cc3:	8d 50 04             	lea    0x4(%eax),%edx
  102cc6:	89 55 14             	mov    %edx,0x14(%ebp)
  102cc9:	8b 30                	mov    (%eax),%esi
  102ccb:	85 f6                	test   %esi,%esi
  102ccd:	75 05                	jne    102cd4 <vprintfmt+0x1a3>
                p = "(null)";
  102ccf:	be 8d 3c 10 00       	mov    $0x103c8d,%esi
            }
            if (width > 0 && padc != '-') {
  102cd4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cd8:	7e 76                	jle    102d50 <vprintfmt+0x21f>
  102cda:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102cde:	74 70                	je     102d50 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102ce0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ce3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ce7:	89 34 24             	mov    %esi,(%esp)
  102cea:	e8 16 03 00 00       	call   103005 <strnlen>
  102cef:	89 c2                	mov    %eax,%edx
  102cf1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102cf4:	29 d0                	sub    %edx,%eax
  102cf6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102cf9:	eb 16                	jmp    102d11 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  102cfb:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102cff:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d02:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d06:	89 04 24             	mov    %eax,(%esp)
  102d09:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0c:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  102d0e:	ff 4d e8             	decl   -0x18(%ebp)
  102d11:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d15:	7f e4                	jg     102cfb <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d17:	eb 37                	jmp    102d50 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  102d19:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102d1d:	74 1f                	je     102d3e <vprintfmt+0x20d>
  102d1f:	83 fb 1f             	cmp    $0x1f,%ebx
  102d22:	7e 05                	jle    102d29 <vprintfmt+0x1f8>
  102d24:	83 fb 7e             	cmp    $0x7e,%ebx
  102d27:	7e 15                	jle    102d3e <vprintfmt+0x20d>
                    putch('?', putdat);
  102d29:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d30:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102d37:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3a:	ff d0                	call   *%eax
  102d3c:	eb 0f                	jmp    102d4d <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  102d3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d41:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d45:	89 1c 24             	mov    %ebx,(%esp)
  102d48:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4b:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d4d:	ff 4d e8             	decl   -0x18(%ebp)
  102d50:	89 f0                	mov    %esi,%eax
  102d52:	8d 70 01             	lea    0x1(%eax),%esi
  102d55:	0f b6 00             	movzbl (%eax),%eax
  102d58:	0f be d8             	movsbl %al,%ebx
  102d5b:	85 db                	test   %ebx,%ebx
  102d5d:	74 27                	je     102d86 <vprintfmt+0x255>
  102d5f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d63:	78 b4                	js     102d19 <vprintfmt+0x1e8>
  102d65:	ff 4d e4             	decl   -0x1c(%ebp)
  102d68:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d6c:	79 ab                	jns    102d19 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  102d6e:	eb 16                	jmp    102d86 <vprintfmt+0x255>
                putch(' ', putdat);
  102d70:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d73:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d77:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102d7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102d81:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  102d83:	ff 4d e8             	decl   -0x18(%ebp)
  102d86:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d8a:	7f e4                	jg     102d70 <vprintfmt+0x23f>
            }
            break;
  102d8c:	e9 6c 01 00 00       	jmp    102efd <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102d91:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d94:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d98:	8d 45 14             	lea    0x14(%ebp),%eax
  102d9b:	89 04 24             	mov    %eax,(%esp)
  102d9e:	e8 16 fd ff ff       	call   102ab9 <getint>
  102da3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102da6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102da9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102daf:	85 d2                	test   %edx,%edx
  102db1:	79 26                	jns    102dd9 <vprintfmt+0x2a8>
                putch('-', putdat);
  102db3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102db6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dba:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102dc1:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc4:	ff d0                	call   *%eax
                num = -(long long)num;
  102dc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102dcc:	f7 d8                	neg    %eax
  102dce:	83 d2 00             	adc    $0x0,%edx
  102dd1:	f7 da                	neg    %edx
  102dd3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dd6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102dd9:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102de0:	e9 a8 00 00 00       	jmp    102e8d <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102de5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102de8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dec:	8d 45 14             	lea    0x14(%ebp),%eax
  102def:	89 04 24             	mov    %eax,(%esp)
  102df2:	e8 73 fc ff ff       	call   102a6a <getuint>
  102df7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dfa:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102dfd:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102e04:	e9 84 00 00 00       	jmp    102e8d <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102e09:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e0c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e10:	8d 45 14             	lea    0x14(%ebp),%eax
  102e13:	89 04 24             	mov    %eax,(%esp)
  102e16:	e8 4f fc ff ff       	call   102a6a <getuint>
  102e1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e1e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102e21:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102e28:	eb 63                	jmp    102e8d <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  102e2a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e31:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102e38:	8b 45 08             	mov    0x8(%ebp),%eax
  102e3b:	ff d0                	call   *%eax
            putch('x', putdat);
  102e3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e40:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e44:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102e4b:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4e:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102e50:	8b 45 14             	mov    0x14(%ebp),%eax
  102e53:	8d 50 04             	lea    0x4(%eax),%edx
  102e56:	89 55 14             	mov    %edx,0x14(%ebp)
  102e59:	8b 00                	mov    (%eax),%eax
  102e5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102e65:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102e6c:	eb 1f                	jmp    102e8d <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102e6e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e71:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e75:	8d 45 14             	lea    0x14(%ebp),%eax
  102e78:	89 04 24             	mov    %eax,(%esp)
  102e7b:	e8 ea fb ff ff       	call   102a6a <getuint>
  102e80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e83:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102e86:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102e8d:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102e91:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e94:	89 54 24 18          	mov    %edx,0x18(%esp)
  102e98:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102e9b:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e9f:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ea3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ea6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ea9:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ead:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102eb1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eb8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ebb:	89 04 24             	mov    %eax,(%esp)
  102ebe:	e8 a5 fa ff ff       	call   102968 <printnum>
            break;
  102ec3:	eb 38                	jmp    102efd <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102ec5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ecc:	89 1c 24             	mov    %ebx,(%esp)
  102ecf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed2:	ff d0                	call   *%eax
            break;
  102ed4:	eb 27                	jmp    102efd <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102ed6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102edd:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102ee4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee7:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102ee9:	ff 4d 10             	decl   0x10(%ebp)
  102eec:	eb 03                	jmp    102ef1 <vprintfmt+0x3c0>
  102eee:	ff 4d 10             	decl   0x10(%ebp)
  102ef1:	8b 45 10             	mov    0x10(%ebp),%eax
  102ef4:	48                   	dec    %eax
  102ef5:	0f b6 00             	movzbl (%eax),%eax
  102ef8:	3c 25                	cmp    $0x25,%al
  102efa:	75 f2                	jne    102eee <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  102efc:	90                   	nop
    while (1) {
  102efd:	e9 37 fc ff ff       	jmp    102b39 <vprintfmt+0x8>
                return;
  102f02:	90                   	nop
        }
    }
}
  102f03:	83 c4 40             	add    $0x40,%esp
  102f06:	5b                   	pop    %ebx
  102f07:	5e                   	pop    %esi
  102f08:	5d                   	pop    %ebp
  102f09:	c3                   	ret    

00102f0a <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102f0a:	55                   	push   %ebp
  102f0b:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102f0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f10:	8b 40 08             	mov    0x8(%eax),%eax
  102f13:	8d 50 01             	lea    0x1(%eax),%edx
  102f16:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f19:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102f1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f1f:	8b 10                	mov    (%eax),%edx
  102f21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f24:	8b 40 04             	mov    0x4(%eax),%eax
  102f27:	39 c2                	cmp    %eax,%edx
  102f29:	73 12                	jae    102f3d <sprintputch+0x33>
        *b->buf ++ = ch;
  102f2b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f2e:	8b 00                	mov    (%eax),%eax
  102f30:	8d 48 01             	lea    0x1(%eax),%ecx
  102f33:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f36:	89 0a                	mov    %ecx,(%edx)
  102f38:	8b 55 08             	mov    0x8(%ebp),%edx
  102f3b:	88 10                	mov    %dl,(%eax)
    }
}
  102f3d:	90                   	nop
  102f3e:	5d                   	pop    %ebp
  102f3f:	c3                   	ret    

00102f40 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102f40:	55                   	push   %ebp
  102f41:	89 e5                	mov    %esp,%ebp
  102f43:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102f46:	8d 45 14             	lea    0x14(%ebp),%eax
  102f49:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102f4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f4f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f53:	8b 45 10             	mov    0x10(%ebp),%eax
  102f56:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f5a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f61:	8b 45 08             	mov    0x8(%ebp),%eax
  102f64:	89 04 24             	mov    %eax,(%esp)
  102f67:	e8 0a 00 00 00       	call   102f76 <vsnprintf>
  102f6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102f6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f72:	89 ec                	mov    %ebp,%esp
  102f74:	5d                   	pop    %ebp
  102f75:	c3                   	ret    

00102f76 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102f76:	55                   	push   %ebp
  102f77:	89 e5                	mov    %esp,%ebp
  102f79:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102f7c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f7f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f82:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f85:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f88:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8b:	01 d0                	add    %edx,%eax
  102f8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f90:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102f97:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102f9b:	74 0a                	je     102fa7 <vsnprintf+0x31>
  102f9d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fa3:	39 c2                	cmp    %eax,%edx
  102fa5:	76 07                	jbe    102fae <vsnprintf+0x38>
        return -E_INVAL;
  102fa7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102fac:	eb 2a                	jmp    102fd8 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102fae:	8b 45 14             	mov    0x14(%ebp),%eax
  102fb1:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102fb5:	8b 45 10             	mov    0x10(%ebp),%eax
  102fb8:	89 44 24 08          	mov    %eax,0x8(%esp)
  102fbc:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102fbf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fc3:	c7 04 24 0a 2f 10 00 	movl   $0x102f0a,(%esp)
  102fca:	e8 62 fb ff ff       	call   102b31 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102fcf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fd2:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102fd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102fd8:	89 ec                	mov    %ebp,%esp
  102fda:	5d                   	pop    %ebp
  102fdb:	c3                   	ret    

00102fdc <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102fdc:	55                   	push   %ebp
  102fdd:	89 e5                	mov    %esp,%ebp
  102fdf:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102fe2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102fe9:	eb 03                	jmp    102fee <strlen+0x12>
        cnt ++;
  102feb:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102fee:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff1:	8d 50 01             	lea    0x1(%eax),%edx
  102ff4:	89 55 08             	mov    %edx,0x8(%ebp)
  102ff7:	0f b6 00             	movzbl (%eax),%eax
  102ffa:	84 c0                	test   %al,%al
  102ffc:	75 ed                	jne    102feb <strlen+0xf>
    }
    return cnt;
  102ffe:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103001:	89 ec                	mov    %ebp,%esp
  103003:	5d                   	pop    %ebp
  103004:	c3                   	ret    

00103005 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103005:	55                   	push   %ebp
  103006:	89 e5                	mov    %esp,%ebp
  103008:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10300b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103012:	eb 03                	jmp    103017 <strnlen+0x12>
        cnt ++;
  103014:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103017:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10301a:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10301d:	73 10                	jae    10302f <strnlen+0x2a>
  10301f:	8b 45 08             	mov    0x8(%ebp),%eax
  103022:	8d 50 01             	lea    0x1(%eax),%edx
  103025:	89 55 08             	mov    %edx,0x8(%ebp)
  103028:	0f b6 00             	movzbl (%eax),%eax
  10302b:	84 c0                	test   %al,%al
  10302d:	75 e5                	jne    103014 <strnlen+0xf>
    }
    return cnt;
  10302f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103032:	89 ec                	mov    %ebp,%esp
  103034:	5d                   	pop    %ebp
  103035:	c3                   	ret    

00103036 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103036:	55                   	push   %ebp
  103037:	89 e5                	mov    %esp,%ebp
  103039:	57                   	push   %edi
  10303a:	56                   	push   %esi
  10303b:	83 ec 20             	sub    $0x20,%esp
  10303e:	8b 45 08             	mov    0x8(%ebp),%eax
  103041:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103044:	8b 45 0c             	mov    0xc(%ebp),%eax
  103047:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10304a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10304d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103050:	89 d1                	mov    %edx,%ecx
  103052:	89 c2                	mov    %eax,%edx
  103054:	89 ce                	mov    %ecx,%esi
  103056:	89 d7                	mov    %edx,%edi
  103058:	ac                   	lods   %ds:(%esi),%al
  103059:	aa                   	stos   %al,%es:(%edi)
  10305a:	84 c0                	test   %al,%al
  10305c:	75 fa                	jne    103058 <strcpy+0x22>
  10305e:	89 fa                	mov    %edi,%edx
  103060:	89 f1                	mov    %esi,%ecx
  103062:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103065:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103068:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10306b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10306e:	83 c4 20             	add    $0x20,%esp
  103071:	5e                   	pop    %esi
  103072:	5f                   	pop    %edi
  103073:	5d                   	pop    %ebp
  103074:	c3                   	ret    

00103075 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103075:	55                   	push   %ebp
  103076:	89 e5                	mov    %esp,%ebp
  103078:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10307b:	8b 45 08             	mov    0x8(%ebp),%eax
  10307e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  103081:	eb 1e                	jmp    1030a1 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  103083:	8b 45 0c             	mov    0xc(%ebp),%eax
  103086:	0f b6 10             	movzbl (%eax),%edx
  103089:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10308c:	88 10                	mov    %dl,(%eax)
  10308e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103091:	0f b6 00             	movzbl (%eax),%eax
  103094:	84 c0                	test   %al,%al
  103096:	74 03                	je     10309b <strncpy+0x26>
            src ++;
  103098:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  10309b:	ff 45 fc             	incl   -0x4(%ebp)
  10309e:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  1030a1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030a5:	75 dc                	jne    103083 <strncpy+0xe>
    }
    return dst;
  1030a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1030aa:	89 ec                	mov    %ebp,%esp
  1030ac:	5d                   	pop    %ebp
  1030ad:	c3                   	ret    

001030ae <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1030ae:	55                   	push   %ebp
  1030af:	89 e5                	mov    %esp,%ebp
  1030b1:	57                   	push   %edi
  1030b2:	56                   	push   %esi
  1030b3:	83 ec 20             	sub    $0x20,%esp
  1030b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1030c2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030c8:	89 d1                	mov    %edx,%ecx
  1030ca:	89 c2                	mov    %eax,%edx
  1030cc:	89 ce                	mov    %ecx,%esi
  1030ce:	89 d7                	mov    %edx,%edi
  1030d0:	ac                   	lods   %ds:(%esi),%al
  1030d1:	ae                   	scas   %es:(%edi),%al
  1030d2:	75 08                	jne    1030dc <strcmp+0x2e>
  1030d4:	84 c0                	test   %al,%al
  1030d6:	75 f8                	jne    1030d0 <strcmp+0x22>
  1030d8:	31 c0                	xor    %eax,%eax
  1030da:	eb 04                	jmp    1030e0 <strcmp+0x32>
  1030dc:	19 c0                	sbb    %eax,%eax
  1030de:	0c 01                	or     $0x1,%al
  1030e0:	89 fa                	mov    %edi,%edx
  1030e2:	89 f1                	mov    %esi,%ecx
  1030e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1030e7:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1030ea:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  1030ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1030f0:	83 c4 20             	add    $0x20,%esp
  1030f3:	5e                   	pop    %esi
  1030f4:	5f                   	pop    %edi
  1030f5:	5d                   	pop    %ebp
  1030f6:	c3                   	ret    

001030f7 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1030f7:	55                   	push   %ebp
  1030f8:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1030fa:	eb 09                	jmp    103105 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  1030fc:	ff 4d 10             	decl   0x10(%ebp)
  1030ff:	ff 45 08             	incl   0x8(%ebp)
  103102:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103105:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103109:	74 1a                	je     103125 <strncmp+0x2e>
  10310b:	8b 45 08             	mov    0x8(%ebp),%eax
  10310e:	0f b6 00             	movzbl (%eax),%eax
  103111:	84 c0                	test   %al,%al
  103113:	74 10                	je     103125 <strncmp+0x2e>
  103115:	8b 45 08             	mov    0x8(%ebp),%eax
  103118:	0f b6 10             	movzbl (%eax),%edx
  10311b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10311e:	0f b6 00             	movzbl (%eax),%eax
  103121:	38 c2                	cmp    %al,%dl
  103123:	74 d7                	je     1030fc <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103125:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103129:	74 18                	je     103143 <strncmp+0x4c>
  10312b:	8b 45 08             	mov    0x8(%ebp),%eax
  10312e:	0f b6 00             	movzbl (%eax),%eax
  103131:	0f b6 d0             	movzbl %al,%edx
  103134:	8b 45 0c             	mov    0xc(%ebp),%eax
  103137:	0f b6 00             	movzbl (%eax),%eax
  10313a:	0f b6 c8             	movzbl %al,%ecx
  10313d:	89 d0                	mov    %edx,%eax
  10313f:	29 c8                	sub    %ecx,%eax
  103141:	eb 05                	jmp    103148 <strncmp+0x51>
  103143:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103148:	5d                   	pop    %ebp
  103149:	c3                   	ret    

0010314a <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  10314a:	55                   	push   %ebp
  10314b:	89 e5                	mov    %esp,%ebp
  10314d:	83 ec 04             	sub    $0x4,%esp
  103150:	8b 45 0c             	mov    0xc(%ebp),%eax
  103153:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103156:	eb 13                	jmp    10316b <strchr+0x21>
        if (*s == c) {
  103158:	8b 45 08             	mov    0x8(%ebp),%eax
  10315b:	0f b6 00             	movzbl (%eax),%eax
  10315e:	38 45 fc             	cmp    %al,-0x4(%ebp)
  103161:	75 05                	jne    103168 <strchr+0x1e>
            return (char *)s;
  103163:	8b 45 08             	mov    0x8(%ebp),%eax
  103166:	eb 12                	jmp    10317a <strchr+0x30>
        }
        s ++;
  103168:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  10316b:	8b 45 08             	mov    0x8(%ebp),%eax
  10316e:	0f b6 00             	movzbl (%eax),%eax
  103171:	84 c0                	test   %al,%al
  103173:	75 e3                	jne    103158 <strchr+0xe>
    }
    return NULL;
  103175:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10317a:	89 ec                	mov    %ebp,%esp
  10317c:	5d                   	pop    %ebp
  10317d:	c3                   	ret    

0010317e <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  10317e:	55                   	push   %ebp
  10317f:	89 e5                	mov    %esp,%ebp
  103181:	83 ec 04             	sub    $0x4,%esp
  103184:	8b 45 0c             	mov    0xc(%ebp),%eax
  103187:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10318a:	eb 0e                	jmp    10319a <strfind+0x1c>
        if (*s == c) {
  10318c:	8b 45 08             	mov    0x8(%ebp),%eax
  10318f:	0f b6 00             	movzbl (%eax),%eax
  103192:	38 45 fc             	cmp    %al,-0x4(%ebp)
  103195:	74 0f                	je     1031a6 <strfind+0x28>
            break;
        }
        s ++;
  103197:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  10319a:	8b 45 08             	mov    0x8(%ebp),%eax
  10319d:	0f b6 00             	movzbl (%eax),%eax
  1031a0:	84 c0                	test   %al,%al
  1031a2:	75 e8                	jne    10318c <strfind+0xe>
  1031a4:	eb 01                	jmp    1031a7 <strfind+0x29>
            break;
  1031a6:	90                   	nop
    }
    return (char *)s;
  1031a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1031aa:	89 ec                	mov    %ebp,%esp
  1031ac:	5d                   	pop    %ebp
  1031ad:	c3                   	ret    

001031ae <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1031ae:	55                   	push   %ebp
  1031af:	89 e5                	mov    %esp,%ebp
  1031b1:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  1031b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1031bb:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1031c2:	eb 03                	jmp    1031c7 <strtol+0x19>
        s ++;
  1031c4:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  1031c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ca:	0f b6 00             	movzbl (%eax),%eax
  1031cd:	3c 20                	cmp    $0x20,%al
  1031cf:	74 f3                	je     1031c4 <strtol+0x16>
  1031d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d4:	0f b6 00             	movzbl (%eax),%eax
  1031d7:	3c 09                	cmp    $0x9,%al
  1031d9:	74 e9                	je     1031c4 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  1031db:	8b 45 08             	mov    0x8(%ebp),%eax
  1031de:	0f b6 00             	movzbl (%eax),%eax
  1031e1:	3c 2b                	cmp    $0x2b,%al
  1031e3:	75 05                	jne    1031ea <strtol+0x3c>
        s ++;
  1031e5:	ff 45 08             	incl   0x8(%ebp)
  1031e8:	eb 14                	jmp    1031fe <strtol+0x50>
    }
    else if (*s == '-') {
  1031ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ed:	0f b6 00             	movzbl (%eax),%eax
  1031f0:	3c 2d                	cmp    $0x2d,%al
  1031f2:	75 0a                	jne    1031fe <strtol+0x50>
        s ++, neg = 1;
  1031f4:	ff 45 08             	incl   0x8(%ebp)
  1031f7:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1031fe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103202:	74 06                	je     10320a <strtol+0x5c>
  103204:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103208:	75 22                	jne    10322c <strtol+0x7e>
  10320a:	8b 45 08             	mov    0x8(%ebp),%eax
  10320d:	0f b6 00             	movzbl (%eax),%eax
  103210:	3c 30                	cmp    $0x30,%al
  103212:	75 18                	jne    10322c <strtol+0x7e>
  103214:	8b 45 08             	mov    0x8(%ebp),%eax
  103217:	40                   	inc    %eax
  103218:	0f b6 00             	movzbl (%eax),%eax
  10321b:	3c 78                	cmp    $0x78,%al
  10321d:	75 0d                	jne    10322c <strtol+0x7e>
        s += 2, base = 16;
  10321f:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103223:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10322a:	eb 29                	jmp    103255 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  10322c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103230:	75 16                	jne    103248 <strtol+0x9a>
  103232:	8b 45 08             	mov    0x8(%ebp),%eax
  103235:	0f b6 00             	movzbl (%eax),%eax
  103238:	3c 30                	cmp    $0x30,%al
  10323a:	75 0c                	jne    103248 <strtol+0x9a>
        s ++, base = 8;
  10323c:	ff 45 08             	incl   0x8(%ebp)
  10323f:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103246:	eb 0d                	jmp    103255 <strtol+0xa7>
    }
    else if (base == 0) {
  103248:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10324c:	75 07                	jne    103255 <strtol+0xa7>
        base = 10;
  10324e:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103255:	8b 45 08             	mov    0x8(%ebp),%eax
  103258:	0f b6 00             	movzbl (%eax),%eax
  10325b:	3c 2f                	cmp    $0x2f,%al
  10325d:	7e 1b                	jle    10327a <strtol+0xcc>
  10325f:	8b 45 08             	mov    0x8(%ebp),%eax
  103262:	0f b6 00             	movzbl (%eax),%eax
  103265:	3c 39                	cmp    $0x39,%al
  103267:	7f 11                	jg     10327a <strtol+0xcc>
            dig = *s - '0';
  103269:	8b 45 08             	mov    0x8(%ebp),%eax
  10326c:	0f b6 00             	movzbl (%eax),%eax
  10326f:	0f be c0             	movsbl %al,%eax
  103272:	83 e8 30             	sub    $0x30,%eax
  103275:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103278:	eb 48                	jmp    1032c2 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  10327a:	8b 45 08             	mov    0x8(%ebp),%eax
  10327d:	0f b6 00             	movzbl (%eax),%eax
  103280:	3c 60                	cmp    $0x60,%al
  103282:	7e 1b                	jle    10329f <strtol+0xf1>
  103284:	8b 45 08             	mov    0x8(%ebp),%eax
  103287:	0f b6 00             	movzbl (%eax),%eax
  10328a:	3c 7a                	cmp    $0x7a,%al
  10328c:	7f 11                	jg     10329f <strtol+0xf1>
            dig = *s - 'a' + 10;
  10328e:	8b 45 08             	mov    0x8(%ebp),%eax
  103291:	0f b6 00             	movzbl (%eax),%eax
  103294:	0f be c0             	movsbl %al,%eax
  103297:	83 e8 57             	sub    $0x57,%eax
  10329a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10329d:	eb 23                	jmp    1032c2 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  10329f:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a2:	0f b6 00             	movzbl (%eax),%eax
  1032a5:	3c 40                	cmp    $0x40,%al
  1032a7:	7e 3b                	jle    1032e4 <strtol+0x136>
  1032a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ac:	0f b6 00             	movzbl (%eax),%eax
  1032af:	3c 5a                	cmp    $0x5a,%al
  1032b1:	7f 31                	jg     1032e4 <strtol+0x136>
            dig = *s - 'A' + 10;
  1032b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b6:	0f b6 00             	movzbl (%eax),%eax
  1032b9:	0f be c0             	movsbl %al,%eax
  1032bc:	83 e8 37             	sub    $0x37,%eax
  1032bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1032c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032c5:	3b 45 10             	cmp    0x10(%ebp),%eax
  1032c8:	7d 19                	jge    1032e3 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  1032ca:	ff 45 08             	incl   0x8(%ebp)
  1032cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032d0:	0f af 45 10          	imul   0x10(%ebp),%eax
  1032d4:	89 c2                	mov    %eax,%edx
  1032d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032d9:	01 d0                	add    %edx,%eax
  1032db:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  1032de:	e9 72 ff ff ff       	jmp    103255 <strtol+0xa7>
            break;
  1032e3:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  1032e4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1032e8:	74 08                	je     1032f2 <strtol+0x144>
        *endptr = (char *) s;
  1032ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032ed:	8b 55 08             	mov    0x8(%ebp),%edx
  1032f0:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  1032f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1032f6:	74 07                	je     1032ff <strtol+0x151>
  1032f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032fb:	f7 d8                	neg    %eax
  1032fd:	eb 03                	jmp    103302 <strtol+0x154>
  1032ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103302:	89 ec                	mov    %ebp,%esp
  103304:	5d                   	pop    %ebp
  103305:	c3                   	ret    

00103306 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103306:	55                   	push   %ebp
  103307:	89 e5                	mov    %esp,%ebp
  103309:	83 ec 28             	sub    $0x28,%esp
  10330c:	89 7d fc             	mov    %edi,-0x4(%ebp)
  10330f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103312:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103315:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  103319:	8b 45 08             	mov    0x8(%ebp),%eax
  10331c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10331f:	88 55 f7             	mov    %dl,-0x9(%ebp)
  103322:	8b 45 10             	mov    0x10(%ebp),%eax
  103325:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103328:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10332b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10332f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103332:	89 d7                	mov    %edx,%edi
  103334:	f3 aa                	rep stos %al,%es:(%edi)
  103336:	89 fa                	mov    %edi,%edx
  103338:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10333b:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10333e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103341:	8b 7d fc             	mov    -0x4(%ebp),%edi
  103344:	89 ec                	mov    %ebp,%esp
  103346:	5d                   	pop    %ebp
  103347:	c3                   	ret    

00103348 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103348:	55                   	push   %ebp
  103349:	89 e5                	mov    %esp,%ebp
  10334b:	57                   	push   %edi
  10334c:	56                   	push   %esi
  10334d:	53                   	push   %ebx
  10334e:	83 ec 30             	sub    $0x30,%esp
  103351:	8b 45 08             	mov    0x8(%ebp),%eax
  103354:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103357:	8b 45 0c             	mov    0xc(%ebp),%eax
  10335a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10335d:	8b 45 10             	mov    0x10(%ebp),%eax
  103360:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103363:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103366:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103369:	73 42                	jae    1033ad <memmove+0x65>
  10336b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10336e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103371:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103374:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103377:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10337a:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10337d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103380:	c1 e8 02             	shr    $0x2,%eax
  103383:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103385:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103388:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10338b:	89 d7                	mov    %edx,%edi
  10338d:	89 c6                	mov    %eax,%esi
  10338f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103391:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103394:	83 e1 03             	and    $0x3,%ecx
  103397:	74 02                	je     10339b <memmove+0x53>
  103399:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10339b:	89 f0                	mov    %esi,%eax
  10339d:	89 fa                	mov    %edi,%edx
  10339f:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1033a2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1033a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  1033a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  1033ab:	eb 36                	jmp    1033e3 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1033ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033b0:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033b6:	01 c2                	add    %eax,%edx
  1033b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033bb:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1033be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033c1:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  1033c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033c7:	89 c1                	mov    %eax,%ecx
  1033c9:	89 d8                	mov    %ebx,%eax
  1033cb:	89 d6                	mov    %edx,%esi
  1033cd:	89 c7                	mov    %eax,%edi
  1033cf:	fd                   	std    
  1033d0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1033d2:	fc                   	cld    
  1033d3:	89 f8                	mov    %edi,%eax
  1033d5:	89 f2                	mov    %esi,%edx
  1033d7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1033da:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1033dd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  1033e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1033e3:	83 c4 30             	add    $0x30,%esp
  1033e6:	5b                   	pop    %ebx
  1033e7:	5e                   	pop    %esi
  1033e8:	5f                   	pop    %edi
  1033e9:	5d                   	pop    %ebp
  1033ea:	c3                   	ret    

001033eb <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1033eb:	55                   	push   %ebp
  1033ec:	89 e5                	mov    %esp,%ebp
  1033ee:	57                   	push   %edi
  1033ef:	56                   	push   %esi
  1033f0:	83 ec 20             	sub    $0x20,%esp
  1033f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1033f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ff:	8b 45 10             	mov    0x10(%ebp),%eax
  103402:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103405:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103408:	c1 e8 02             	shr    $0x2,%eax
  10340b:	89 c1                	mov    %eax,%ecx
    asm volatile (
  10340d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103410:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103413:	89 d7                	mov    %edx,%edi
  103415:	89 c6                	mov    %eax,%esi
  103417:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103419:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10341c:	83 e1 03             	and    $0x3,%ecx
  10341f:	74 02                	je     103423 <memcpy+0x38>
  103421:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103423:	89 f0                	mov    %esi,%eax
  103425:	89 fa                	mov    %edi,%edx
  103427:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10342a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10342d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  103430:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103433:	83 c4 20             	add    $0x20,%esp
  103436:	5e                   	pop    %esi
  103437:	5f                   	pop    %edi
  103438:	5d                   	pop    %ebp
  103439:	c3                   	ret    

0010343a <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  10343a:	55                   	push   %ebp
  10343b:	89 e5                	mov    %esp,%ebp
  10343d:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103440:	8b 45 08             	mov    0x8(%ebp),%eax
  103443:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103446:	8b 45 0c             	mov    0xc(%ebp),%eax
  103449:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10344c:	eb 2e                	jmp    10347c <memcmp+0x42>
        if (*s1 != *s2) {
  10344e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103451:	0f b6 10             	movzbl (%eax),%edx
  103454:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103457:	0f b6 00             	movzbl (%eax),%eax
  10345a:	38 c2                	cmp    %al,%dl
  10345c:	74 18                	je     103476 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10345e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103461:	0f b6 00             	movzbl (%eax),%eax
  103464:	0f b6 d0             	movzbl %al,%edx
  103467:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10346a:	0f b6 00             	movzbl (%eax),%eax
  10346d:	0f b6 c8             	movzbl %al,%ecx
  103470:	89 d0                	mov    %edx,%eax
  103472:	29 c8                	sub    %ecx,%eax
  103474:	eb 18                	jmp    10348e <memcmp+0x54>
        }
        s1 ++, s2 ++;
  103476:	ff 45 fc             	incl   -0x4(%ebp)
  103479:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  10347c:	8b 45 10             	mov    0x10(%ebp),%eax
  10347f:	8d 50 ff             	lea    -0x1(%eax),%edx
  103482:	89 55 10             	mov    %edx,0x10(%ebp)
  103485:	85 c0                	test   %eax,%eax
  103487:	75 c5                	jne    10344e <memcmp+0x14>
    }
    return 0;
  103489:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10348e:	89 ec                	mov    %ebp,%esp
  103490:	5d                   	pop    %ebp
  103491:	c3                   	ret    
