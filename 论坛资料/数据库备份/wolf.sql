/*
 Navicat Premium Data Transfer

 Source Server         : 152.32.192.200
 Source Server Type    : MySQL
 Source Server Version : 100227
 Source Host           : 152.32.192.200:3306
 Source Schema         : wolf

 Target Server Type    : MySQL
 Target Server Version : 100227
 File Encoding         : 65001

 Date: 13/08/2020 17:33:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wolf_article
-- ----------------------------
DROP TABLE IF EXISTS `wolf_article`;
CREATE TABLE `wolf_article`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `articleTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子标题',
  `articleTags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子表情，英文状态逗号分隔',
  `articleAuthorId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子作者 id',
  `articleCommentCount` int(11) NOT NULL COMMENT '帖子回帖计数',
  `articleViewCount` int(11) NOT NULL COMMENT '帖子浏览计数',
  `articleContent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子正文内容',
  `articleRewardContent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子打赏区内容',
  `articleRewardPoint` int(11) NOT NULL COMMENT '帖子打赏积分',
  `articlePermalink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子访问路径',
  `articleCreateTime` bigint(20) NOT NULL COMMENT '帖子创建时间',
  `articleUpdateTime` bigint(20) NOT NULL COMMENT '帖子更新时间',
  `articleLatestCmtTime` bigint(20) NOT NULL COMMENT '帖子最新回帖时间',
  `articleLatestCmterName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子最新回帖者用户名',
  `articleRandomDouble` double NOT NULL COMMENT '帖子随机数，用于快速选择随机帖子',
  `articleCommentable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子是否可回帖',
  `articleEditorType` int(11) NOT NULL COMMENT '0：CodeMirror-Markdown',
  `articleStatus` int(11) NOT NULL COMMENT '0：正常，1：封禁，2：锁定',
  `articleType` int(11) NOT NULL COMMENT '0：普通帖子，1：机要，2：同城广播，3：思绪',
  `articleThankCnt` int(11) NOT NULL COMMENT '帖子感谢计数',
  `articleGoodCnt` int(11) NOT NULL COMMENT '帖子点赞计数',
  `articleBadCnt` int(11) NOT NULL COMMENT '帖子点踩计数',
  `articleCollectCnt` int(11) NOT NULL COMMENT '帖子收藏计数',
  `articleWatchCnt` int(11) NOT NULL COMMENT '帖子关注计数',
  `redditScore` double NOT NULL COMMENT '帖子 Reddit 算法评分',
  `articleCity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发帖 IP 所在城市',
  `articleIP` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发帖 IP',
  `articleUA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'User-Agent',
  `articleStick` bigint(20) NOT NULL COMMENT '帖子置顶时间',
  `articleAnonymous` int(11) NOT NULL COMMENT '0：公开，1：匿名',
  `articlePerfect` int(11) NOT NULL COMMENT '0：非优选，1：优选',
  `articleAnonymousView` int(11) NOT NULL COMMENT '0：允许不登录浏览， 1：登录才可浏览',
  `articleAudioURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子语音文件 URL',
  `articleQnAOfferPoint` int(11) NOT NULL COMMENT '问答悬赏积分（仅作用于问答帖）',
  `articlePushOrder` int(11) NOT NULL COMMENT '周/月邮件推送优先级',
  `articleImg1URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子首图地址',
  `articleShowInList` int(11) NOT NULL COMMENT '帖子是否在列表展示：0 不展示，1 展示 https://github.com/b3log/symphony/issues/927',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_article
-- ----------------------------
INSERT INTO `wolf_article` VALUES ('1586751559998', '欢迎来到  Java 论坛 :Java 开发者的网上家园', '系统公告', '1586751549756', 0, 4, 'Java论坛，专注Java技术分享，促进Java开发领域的知识和创新的传播，解决编程之惑，为程序员服务。', '', 0, '/article/1586751559998', 1586751559508, 1586751559508, 1586751559998, '', 0.5075092390420559, '1', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, '', 0, 0, '', 1);
INSERT INTO `wolf_article` VALUES ('1586759249983', 'ConcurrentHashMap 源码分析（基于 jdk1.8）', 'java', '1586752131583', 2, 37, '# ConcurrentHashMap源码分析（基于jdk1.8）\n\n# 简介\n\n1.8版本的并发HashMap相较与1.7的版本，去掉了分段锁，每次操作都在hash table的一个桶位上进行cas或加锁操作，细化了加锁粒度，提高并发能力。初次之外，在哈希冲突处理方面更新了增到8转红黑树，减到6转链表。ConcurrentHashMap 大量采用CAS的算法。\n\n\n\n We do not want to waste the space required to associate a distinct lock object with each bin, so instead use the first node of a bin list itself as a lock. Locking support for these locks relies on builtin \"synchronized\" monitors.\n\n The main disadvantage of per-bin locks is that other update operations on other nodes in a bin list protected by the same lock can stall\n\n public class ConcurrentHashMap<K,V> extends AbstractMap<K,V>\n    implements ConcurrentMap<K,V>, Serializable {\n    }\n\n### 类属性\n\n+ private static final int MAXIMUM_CAPACITY = 1 << 30; \n\n    table桶数最大值，前两位用作控制标志\n\n\n+ private static final int DEFAULT_CAPACITY = 16;\n\n    table桶数初始化默认值，需为2的幂次方\n    /**\n     * The largest possible (non-power of two) array size.\n     * Needed by toArray and related methods.\n     */\n+ static final int MAX_ARRAY_SIZE = Integer.MAX_VALUE - 8;\n\n\n+ private static final float LOAD_FACTOR = 0.75f;\n\n    加载因子，扩容的阀值，可在构造方法定义\n\n\n+ static final int TREEIFY_THRESHOLD = 8;\n\n    树化阀值1，当链表节点超过8允许转化为红黑树\n\n+ static final int UNTREEIFY_THRESHOLD = 6;\n\n    链化阀值1，当树节点小于6则转化为链表\n\n+ static final int MIN_TREEIFY_CAPACITY = 64;\n\n    树化阀值2，当数组桶树达到64以上才允许链表树化\n\n+ private static final int MIN_TRANSFER_STRIDE = 16;\n\n    链化阀值2，与上类似\n\n    /**\n     * The number of bits used for generation stamp in sizeCtl.\n     * Must be at least 6 for 32bit arrays.\n     */\n    private static int RESIZE_STAMP_BITS = 16;\n\n    /**\n     * The maximum number of threads that can help resize.\n     * Must fit in 32 - RESIZE_STAMP_BITS bits.\n     */\n    private static final int MAX_RESIZERS = (1 << (32 - RESIZE_STAMP_BITS)) - 1;\n\n    /**\n     * The bit shift for recording size stamp in sizeCtl.\n     */\n    private static final int RESIZE_STAMP_SHIFT = 32 - RESIZE_STAMP_BITS;\n\n    /*\n     * Encodings for Node hash fields. See above for explanation.\n     */\n    static final int MOVED     = -1; // hash for forwarding nodes\n    static final int TREEBIN   = -2; // hash for roots of trees\n    static final int RESERVED  = -3; // hash for transient reservations\n    static final int HASH_BITS = 0x7fffffff; // usable bits of normal node hash\n\n    /** Number of CPUS, to place bounds on some sizings */\n    static final int NCPU = Runtime.getRuntime().availableProcessors();\n\n\n## 主要的内部类\n\n### Node\n\n+ final保证线程安全性 volatile保证线程间修改（update）的可见性\n\n    static class Node<K,V> implements Map.Entry<K,V> {\n        // 键值对的hash计算值\n        final int hash;\n        final K key;\n        volatile V val;\n        // 下一个节点，链表法解决冲突\n        volatile Node<K,V> next;\n    }\n\n## 对象属性\n\n+ transient volatile Node<K,V>[] table;\n\n    桶数组，数组长度为2的幂次方\n\n+ private transient volatile Node<K,V>[] nextTable;\n\n    resize操作使用的桶数组\n\n    /**\n     * Base counter value, used mainly when there is no contention,\n     * but also as a fallback during table initialization\n     * races. Updated via CAS.\n     */\n    private transient volatile long baseCount;\n\n    /**\n     * Table initialization and resizing control.  When negative, the\n     * table is being initialized or resized: -1 for initialization,\n     * else -(1 + the number of active resizing threads).  Otherwise,\n     * when table is null, holds the initial table size to use upon\n     * creation, or 0 for default. After initialization, holds the\n     * next element count value upon which to resize the table.\n     */\n    private transient volatile int sizeCtl;\n\n    /**\n     * The next table index (plus one) to split while resizing.\n     */\n    private transient volatile int transferIndex;\n\n    /**\n     * Spinlock (locked via CAS) used when resizing and/or creating CounterCells.\n     */\n    private transient volatile int cellsBusy;\n\n    /**\n     * Table of counter cells. When non-null, size is a power of 2.\n     */\n    private transient volatile CounterCell[] counterCells;\n\n+ private transient KeySetView<K,V> keySet;<br/>private transient ValuesView<K,V> values;<br/>private transient EntrySetView<K,V> entrySet;\n\n    数据视图\n\n\n## 主要的几个方法\n\n### spread\n\n再散列，通过哈希吗的高位与低位抑或，使K-V的分布更均匀。HASH_BITS为7fffffff,通过与其相与保障最高位为0，避免出现ffff0000^0000ffff=ffffffff发送数组越界的情况\n\n    static final int spread(int h) {\n        return (h ^ (h >>> 16)) & HASH_BITS;\n    }\n\n\n### get\n\n    // 与HashMap不同，key不能为Null\n    public V get(Object key) {\n        Node<K,V>[] tab; Node<K,V> e, p; int n, eh; K ek;\n        // spread通过高位参与运算，获取数组的桶位\n        int h = spread(key.hashCode());\n        if ((tab = table) != null && (n = tab.length) > 0 &&\n            // 取出该桶位的第一个节点\n            (e = tabAt(tab, (n - 1) & h)) != null) {\n            // 若第一个节点就是当前key，直接返回第一个节点的val\n            if ((eh = e.hash) == h) {\n                if ((ek = e.key) == key || (ek != null && key.equals(ek)))\n                    return e.val;\n            }\n            // 在冲突解决的数据结构中查找节点并返回其val\n            // eh<0 --> hash最高位为1，代表当前桶位冲突解决使用的是红黑树，find查找\n            else if (eh < 0)\n                return (p = e.find(h, key)) != null ? p.val : null;\n            // eh<0 --> hash最高位为0，代表当前桶位冲突解决使用的是链表，直接遍历查询\n            while ((e = e.next) != null) {\n                if (e.hash == h &&\n                    ((ek = e.key) == key || (ek != null && key.equals(ek))))\n                    return e.val;\n            }\n        }\n        return null;\n    }\n\n### put\n\nput实际实现为putVal，增加一个参数，判断是否覆盖原有的K-V\n\nKey和Value都不能为Null\n\n    /**\n     * Maps the specified key to the specified value in this table.\n     * Neither the key nor the value can be null.\n     *\n     * <p>The value can be retrieved by calling the {@code get} method\n     * with a key that is equal to the original key.\n     */\n    public V put(K key, V value) {\n        return putVal(key, value, false);\n    }\n  \n    /** Implementation for put and putIfAbsent */\n    final V putVal(K key, V value, boolean onlyIfAbsent) {\n        if (key == null || value == null) throw new NullPointerException();\n        int hash = spread(key.hashCode());\n        int binCount = 0;\n        for (Node<K,V>[] tab = table;;) {\n            Node<K,V> f; int n, i, fh;\n            // 若桶数组仍未初始化，则先初始化数组\n            if (tab == null || (n = tab.length) == 0)\n                tab = initTable();\n            // 若该桶位无头节点，则通过CAS操作插入桶位，退出循环\n            else if ((f = tabAt(tab, i = (n - 1) & hash)) == null) {\n                if (casTabAt(tab, i, null,\n                             new Node<K,V>(hash, key, value, null)))\n                    break;                   // no lock when adding to empty bin\n            }\n            // 查看该头节点状态，若为MOVED（当前正在resize操作），执行helpTransfer帮助resize\n            else if ((fh = f.hash) == MOVED)\n                tab = helpTransfer(tab, f);\n            // 当前头节点已经存在或者CAS操作失败，对头结点synchronized加对象锁，执行冲突解决\n            else {\n                V oldVal = null;\n                synchronized (f) {\n                    // 双重检查\n                    if (tabAt(tab, i) == f) {\n                        // 若是链表\n                        if (fh >= 0) {\n                            binCount = 1;\n                            for (Node<K,V> e = f;; ++binCount) {\n                                K ek;\n                                if (e.hash == hash &&\n                                    ((ek = e.key) == key ||\n                                     (ek != null && key.equals(ek)))) {\n                                    oldVal = e.val;\n                                    // 发现插入Key已存在，根据onlyIfAbsent执行覆盖\n                                    if (!onlyIfAbsent)\n                                        e.val = value;\n                                    break;\n                                }\n                                Node<K,V> pred = e;\n                                // 没有相同的Key,接入链表尾部\n                                if ((e = e.next) == null) {\n                                    pred.next = new Node<K,V>(hash, key,\n                                                              value, null);\n                                    break;\n                                }\n                            }\n                        }\n                        // 若是红黑树\n                        else if (f instanceof TreeBin) {\n                            Node<K,V> p;\n                            binCount = 2;\n                            if ((p = ((TreeBin<K,V>)f).putTreeVal(hash, key,\n                                                           value)) != null) {\n                                oldVal = p.val;\n                                if (!onlyIfAbsent)\n                                    p.val = value;\n                            }\n                        }\n                    }\n                }\n                // bitCount为链插入后的长度,达到阀值就执行树化操作\n                if (binCount != 0) {\n                    if (binCount >= TREEIFY_THRESHOLD)\n                        treeifyBin(tab, i);\n                    if (oldVal != null)\n                        return oldVal;\n                    break;\n                }\n            }\n        }\n        // K-V计数加一\n        addCount(1L, binCount);\n        return null;\n    }\n\n### size\n\nsize操作返回的值来自于CounterCell[]中元素值之和，其中的元素改动又来自于addCount方法\n\n可知CounterCell[]其中每个元素代表着桶数组中每个元素内的节点数\n\n    /**\n     * {@inheritDoc}\n     */\n    public int size() {\n        long n = sumCount();\n        return ((n < 0L) ? 0 :\n                (n > (long)Integer.MAX_VALUE) ? Integer.MAX_VALUE abc :\n                (int)n);\n    }\n  \n     @sun.misc.Contended static final class CounterCell {\n        volatile long value;\n        CounterCell(long x) { value = x; }\n    }\n  \n    final long sumCount() {\n        CounterCell[] as = counterCells; CounterCell a;\n        long sum = baseCount;\n        if (as != null) {\n            for (int i = 0; i < as.length; ++i) {\n                if ((a = as[i]) != null)\n                    sum += a.value;\n            }\n        }\n        return sum;\n    }\n\n### resize\n', '\n', 0, '/article/1586759249983', 1586759249641, 1586759454754, 1586765347335, 'wolf', 0.03745650371094733, '1', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', 0, 0, 0, 0, '', 0, 0, '', 1);
INSERT INTO `wolf_article` VALUES ('1586759670650', 'HashMap 源码解析 (jdk8 版)', 'HashMap,jdk8', '1586751549756', 0, 8, 'HashMap源码解析(jdk8版)\n\nHashMap允许key为null,也允许value为null<br/>\n\nHashMap与HashTable两个类是差不多的,除了HashTable是线程安全且不允许null值这一点外.\n\n基本概念:HashMap底层是数组+链表(数组的每个值都是一条链表的头结点),1.8后加入了红黑树(当链表长度达到8就自动将该链表替换为红黑树),通过计算key的哈希码,在经过高位参与位运算计算得出键值对(将key和value包装起来的对象)所在的数组的下标,采用头插入法插入该位置的链表(若该位置是空的就直接插入)\n\n## HashMap的相关域:\n\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    static final int DEFAULT_INITIAL_CAPACITY = 1 << 4; \n\n    static final int MAXIMUM_CAPACITY = 1 << 30;\n\n    static final float DEFAULT_LOAD_FACTOR = 0.75f;\n\n    static final int TREEIFY_THRESHOLD = 8;\n\n    static final int UNTREEIFY_THRESHOLD = 6;\n\n    static final int MIN_TREEIFY_CAPACITY = 64;\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n+ DEFAULT_INITIAL_CAPACITY: 默认底层数组的初始大小(2^4),可通过构造参数指定\n+ MAXIMUM_CAPACITY: 数组的最大长度(2^31),超过将替换为此值\n+ DEFAULT_LOAD_FACTOR: 默认负载因子,为0.75,可通过构造参数指定\n+ TREEIFY_THRESHOLD: 链表转换为红黑树的阙值,当链表长度达到8自动转为红黑树进行存储(前提是数组长度大于等于64)\n+ UNTREEIFY_THRESHOLD: 红黑树转为链表的阙值,当红黑树结点个数减小到6时,自动转为链表存储\n+ MIN_TREEIFY_CAPACITY: 链表进行树化的前提条件,数组长度要达到64或一上,在这之前只能通过数组扩容来减少链表长度\n\n  `````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    transient Node<K,V>[] table;\n\n    transient Set<Map.Entry<K,V>> entrySet;\n\n    transient int size;\n\n    transient int modCount;\n\n    int threshold;\n\n    final float loadFactor;\n  `````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n+ table: 底层数组,可动态扩容,数组长度为2的整数次方\n+ size: 这个map中存放的键值对数目\n+ modCount: 记录这个map数据结构发生改变的次数(发送插入删除或者链表与树相互转换的操作),由于fail-fast机制\n+ threshold: 数组进行扩容的下个阙值(当前键值对数量达到这个值后进行 `resize()`(扩容)操作)(threshold = capacity * load factor)\n+ loadFactor:　实际的负载因子\n\n## 哈希码计算方法 `hash(Object key)`\n\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    static final int hash(Object key) {\n        int h;\n        return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);\n    }\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n+ 局部变量h存放hashCode()放回的初始哈希码,通过h右移16位与h异或(右移后,前16位为0,异或不改变h的前16位值)得到最终的哈希吗.<br/>\n  通过高位参与位运算可以减少数组长度较低时的哈希码冲突问题(取模时,高位变低位不变,冲突几率会变高)\n\n## 链表结点的数据结构 `Node<K,V>`\n\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    static class Node<K,V> implements Map.Entry<K,V> {\n        final int hash; // 计算得到的hash码\n        final K key;    // 键对象\n        V value;        // 值对象\n        Node<K,V> next; // 下一个结点\n        方法略...\n    }\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n## 树节点数据结构v `TreeNode<K,V>`\n\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    static final class TreeNode<K,V> extends LinkedHashMap.Entry<K,V> {\n        TreeNode<K,V> parent;  // 父亲节点\n        TreeNode<K,V> left;    // 左子树\n        TreeNode<K,V> right;   //右子树\n        TreeNode<K,V> prev;    // needed to unlink next upon deletion\n        boolean red;            // 红色还是黑色\n        TreeNode(int hash, K key, V val, Node<K,V> next) {\n            super(hash, key, val, next);\n        方法略...  \n    }\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n+ 通过继承 `LinkedHashMap.Entry<K,V>`,实际上间接继承了链表的 `Node<K,V>`\n\n## 获取value:get(Object key)\n\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    public V get(Object key) {\n        Node<K,V> e;\n        return (e = getNode(hash(key), key)) == null ? null : e.value;      //1\n    }\n\n    final Node<K,V> getNode(int hash, Object key) {\n        Node<K,V>[] tab;\n        Node<K,V> first, e;\n        int n;\n        K k;\n        if ((tab = table) != null && (n = tab.length) > 0 &&\n            (first = tab[(n - 1) & hash]) != null) {                        //2\n            if (first.hash == hash && // always check first node\n                ((k = first.key) == key || (key != null && key.equals(k)))) //3\n                return first;\n            if ((e = first.next) != null) {                                 //4\n                if (first instanceof TreeNode)\n                    return ((TreeNode<K,V>)first).getTreeNode(hash, key);\n                do {\n                    if (e.hash == hash &&\n                        ((k = e.key) == key || (key != null && key.equals(k))))\n                        return e;\n                } while ((e = e.next) != null);\n            }\n        }\n        return null;\n    }\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n1. 计算key的哈希码,传入getNode方法,放回Node对象或者null\n2. 如果table为null,table是空的或者数组( (length-1)&hash )处的值为null,就返回null,否则进入3\n3. 检查第一个结点,若是指定的key,直接返回该结点,否则进入4\n4. 如果这个树/链表不止一个结点,先判断是树还是链表,再进行对应的结点查找,找到就返回,否则返回null.\n\n## 增加键值对 `put(K key, V value)`\n\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    public V put(K key, V value) {\n        return putVal(hash(key), key, value, false, true);\n    }\n\n    /**\n    * Implements Map.put and related methods\n    *\n    * @param hash hash for key\n    * @param key the key\n    * @param value the value to put\n    * @param onlyIfAbsent if true, don\'t change existing value\n    * @param evict if false, the table is in creation mode.\n    * @return previous value, or null if none\n    */\n    final V putVal(int hash, K key, V value, boolean onlyIfAbsent,\n                boolean evict) {\n        Node<K,V>[] tab;\n        Node<K,V> p;\n        int n, i;\n        if ((tab = table) == null || (n = tab.length) == 0)             //1\n            n = (tab = resize()).length;\n        if ((p = tab[i = (n - 1) & hash]) == null)                      //2\n            tab[i] = newNode(hash, key, value, null);\n        else {\n            Node<K,V> e; K k;\n            if (p.hash == hash &&\n                ((k = p.key) == key || (key != null && key.equals(k)))) //3\n                e = p;\n            else if (p instanceof TreeNode)                             //4\n                e = ((TreeNode<K,V>)p).putTreeVal(this, tab, hash, key, value);\n            else {                                                      //5\n                for (int binCount = 0; ; ++binCount) {\n                    if ((e = p.next) == null) {                   \n                        p.next = newNode(hash, key, value, null);\n                        if (binCount >= TREEIFY_THRESHOLD - 1) // -1 for 1st\n                            treeifyBin(tab, hash);\n                        break;\n                    }\n                    if (e.hash == hash &&\n                        ((k = e.key) == key || (key != null && key.equals(k))))\n                        break;\n                    p = e;\n                }\n            }\n            if (e != null) { // existing mapping for key                //6\n                V oldValue = e.value;\n                if (!onlyIfAbsent || oldValue == null)\n                    e.value = value;\n                afterNodeAccess(e);\n                return oldValue;\n            }\n        }                                                               //7\n        ++modCount;\n        if (++size > threshold)\n            resize();\n        afterNodeInsertion(evict);\n        return null;\n    }\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n1. 如果数组为null或是空的,则 `resize()`扩充容量\n2. 通过hash计算并位运算取摸获得数组下标,若该位置是空的,新建链表结点直接填坑然后跳到7,否则进入3\n3. 判断头结点的key跟要put进去的key是否同一个,是则将其引用赋给e,进入6,否则进入4\n4. 判断头结点是不是树结点,是则执行 `putTreeVal`,若树中已存在该key,则直接返回该键值对(赋给e),否则新建并插入结点并返回null,然后进入6.如果不是树节点则进入5\n5. 在链表中遍历,如果不存在,就新建一个结点,然后是否达到树化的阙值,是就转化为树结构,之后跳到7.如果存在就把它的引用赋给e跳到6\n6. 在搜索到当前map中存在相同key时候将该键值对赋给e,在这里进行值的覆盖,并返回旧值\n7. 对改动进行计数,判断是否需要进行数组扩容,返回null\n\n## 移除键值对 `remove(Object key)`\n\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    public V remove(Object key) {\n        Node<K,V> e;\n        return (e = removeNode(hash(key), key, null, false, true)) == null ?\n            null : e.value;\n    }\n\n    final Node<K,V> removeNode(int hash, Object key, Object value,\n                            boolean matchValue, boolean movable) {\n        Node<K,V>[] tab;\n        Node<K,V> p;\n        int n,index;\n        if ((tab = table) != null && (n = tab.length) > 0 &&            //1\n            (p = tab[index = (n - 1) & hash]) != null) {\n            Node<K,V> node = null, e;\n            K k;\n            V v;\n            if (p.hash == hash &&\n                ((k = p.key) == key || (key != null && key.equals(k)))) //2\n                node = p;\n            else if ((e = p.next) != null) {                            //3\n                if (p instanceof TreeNode)\n                    node = ((TreeNode<K,V>)p).getTreeNode(hash, key);\n                else {\n                    do {\n                        if (e.hash == hash &&\n                            ((k = e.key) == key ||\n                            (key != null && key.equals(k)))) {\n                            node = e;\n                            break;\n                        }\n                        p = e;\n                    } while ((e = e.next) != null);\n                }\n            }\n            if (node != null && (!matchValue || (v = node.value) == value ||    //4\n                                (value != null && value.equals(v)))) {\n                if (node instanceof TreeNode)\n                    ((TreeNode<K,V>)node).removeTreeNode(this, tab, movable);\n                else if (node == p)\n                    tab[index] = node.next;\n                else\n                    p.next = node.next;\n                ++modCount;\n                --size;\n                afterNodeRemoval(node);\n                return node;\n            }\n        }\n        return null;\n    }\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n1. 判断底层数组是否为null或者是空的,是就直接返回null,否则2\n2. 判断头结点是否就是要移除的键值对,是就赋给e,进入4,否则进入3\n3. 判断是树还是链表并进行相应遍历,找到符合的键值对,并赋给e,进入4,若查无,返回null\n4. 针对不同的存储结构进行相应的移除操作,并更新相关的计数值\n\n## 链表的树化操作 `treeifyBin(Node<K,V>[] tab, int hash)`\n\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n    /**\n    * Replaces all linked nodes in bin at index for given hash unless\n    * table is too small, in which case resizes instead.\n    */\n    final void treeifyBin(Node<K,V>[] tab, int hash) {\n        int n, index; Node<K,V> e;\n        if (tab == null || (n = tab.length) < MIN_TREEIFY_CAPACITY)\n            resize();\n        else if ((e = tab[index = (n - 1) & hash]) != null) {\n            TreeNode<K,V> hd = null, tl = null;\n            do {\n                TreeNode<K,V> p = replacementTreeNode(e, null);\n                if (tl == null)\n                    hd = p;\n                else {\n                    p.prev = tl;\n                    tl.next = p;\n                }\n                tl = p;\n            } while ((e = e.next) != null);\n            if ((tab[index] = hd) != null)\n                hd.treeify(tab);\n        }\n    }\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\n\n+ 先将链表结点转化成树结点,构造成双向链表,在 `treeify`进行红黑树的构造\n\n## 扩容操作 `resize`\n\n[] newTab = (Nodek,v[])new Node[newCap];\n        table = newTab;\n        if (oldTab != null) {                                                   // 7\n            for (int j = 0; j < oldCap; ++j) {\n                Nodek,v e;\n                if ((e = oldTab[j]) != null) {\n                    oldTab[j] = null;\n                    if (e.next == null)                                         // 7-1\n                        newTab[e.hash & (newCap - 1)] = e;\n                    else if (e instanceof TreeNode)                             // 7-2\n                        ((TreeNodek,v)e).split(this, newTab, j, oldCap);\n                    else { // preserve order                                    // 7-3\n                        Nodek,v loHead = null, loTail = null;\n                        Nodek,v hiHead = null, hiTail = null;\n                        Nodek,v next;\n                        do {\n                            next = e.next;\n                            if ((e.hash & oldCap) == 0) {\n                                if (loTail == null)\n                                    loHead = e;\n                                else\n                                    loTail.next = e;\n                                loTail = e;\n                            }\n                            else {\n                                if (hiTail == null)\n                                    hiHead = e;\n                                else\n                                    hiTail.next = e;\n                                hiTail = e;\n                            }\n                        } while ((e = next) != null);\n                        if (loTail != null) {\n                            loTail.next = null;\n                            newTab[j] = loHead;\n                        }\n                        if (hiTail != null) {\n                            hiTail.next = null;\n                            newTab[j + oldCap] = hiHead;\n                        }\n                    }\n                }\n            }\n        }\n        return newTab;\n    }\n\">\n```\n    /**\n    * Initializes or doubles table size.  If null, allocates in\n    * accord with initial capacity target held in field threshold.\n    * Otherwise, because we are using power-of-two expansion, the\n    * elements from each bin must either stay at same index, or move\n    * with a power of two offset in the new table.\n    *\n    * @return the table\n    */\n    final Node<K,V>[] resize() {\n        Node<K,V>[] oldTab = table;\n        int oldCap = (oldTab == null) ? 0 : oldTab.length;\n        int oldThr = threshold;\n        int newCap, newThr = 0;\n        if (oldCap > 0) {\n            if (oldCap >= MAXIMUM_CAPACITY) {                           // 1\n                threshold = Integer.MAX_VALUE;\n                return oldTab;\n            }\n            else if ((newCap = oldCap << 1) < MAXIMUM_CAPACITY &&       // 2\n                    oldCap >= DEFAULT_INITIAL_CAPACITY)\n                newThr = oldThr << 1; // double threshold\n        }\n        else if (oldThr > 0) // initial capacity was placed in threshold    // 3\n            newCap = oldThr;\n        else {               // zero initial threshold signifies using defaults // 4\n            newCap = DEFAULT_INITIAL_CAPACITY;\n            newThr = (int)(DEFAULT_LOAD_FACTOR * DEFAULT_INITIAL_CAPACITY);\n        }\n        if (newThr == 0) {                                                      // 5\n            float ft = (float)newCap * loadFactor;\n            newThr = (newCap < MAXIMUM_CAPACITY && ft < (float)MAXIMUM_CAPACITY ?\n                    (int)ft : Integer.MAX_VALUE);\n        }\n        threshold = newThr;                                                     // 6\n        @SuppressWarnings({\"rawtypes\",\"unchecked\"})\n            Node<K,V>[] newTab = (Node<K,V>[])new Node[newCap];\n        table = newTab;\n        if (oldTab != null) {                                                   // 7\n            for (int j = 0; j < oldCap; ++j) {\n                Node<K,V> e;\n                if ((e = oldTab[j]) != null) {\n                    oldTab[j] = null;\n                    if (e.next == null)                                         // 7-1\n                        newTab[e.hash & (newCap - 1)] = e;\n                    else if (e instanceof TreeNode)                             // 7-2\n                        ((TreeNode<K,V>)e).split(this, newTab, j, oldCap);\n                    else { // preserve order                                    // 7-3\n                        Node<K,V> loHead = null, loTail = null;\n                        Node<K,V> hiHead = null, hiTail = null;\n                        Node<K,V> next;\n                        do {\n                            next = e.next;\n                            if ((e.hash & oldCap) == 0) {\n                                if (loTail == null)\n                                    loHead = e;\n                                else\n                                    loTail.next = e;\n                                loTail = e;\n                            }\n                            else {\n                                if (hiTail == null)\n                                    hiHead = e;\n                                else\n                                    hiTail.next = e;\n                                hiTail = e;\n                            }\n                        } while ((e = next) != null);\n                        if (loTail != null) {\n                            loTail.next = null;\n                            newTab[j] = loHead;\n                        }\n                        if (hiTail != null) {\n                            hiTail.next = null;\n                            newTab[j + oldCap] = hiHead;\n                        }\n                    }\n                }\n            }\n        }\n        return newTab;\n    }\n```\n\n1. 若底层数组长度大于等于允许的最大值,将扩容阙值设为MAX_INT,直接不做任何操作,直接返回原数组\n2. 如果底层数组长度是大于默认初始长度且当前长度*2小于允许的最大值,则将新的数组长度,扩容阙值都设为原来的两倍\n3. 当前数组未初始化,且扩容阙值已经初始化(不为0),将新的数组长度设定为扩容阙值,跳到5\n4. 当前数组与扩容阙值都未初始化,将新的数组长度和扩容阙值设为默认初始值\n5. 根据新的数组长度值计算新的扩容阙值,如果新的数组长度值或者新的阙值大于数组长度的允许最大值,则将其替换为MAX_INT,反之保留\n6. 将经过上述计算得到的新值进行更新(设置threshold为新值, 实例化一个新长度的底层数组)\n7. 遍历数组的每个坑位,将老数组的值搬运到新的数组中\n   7-1. 若该坑位只有一个结点,直接搬运到新数组对应坑位,需要重新计算下标,因为新数组的长度已经改变\n   7-2. 若该坑位放的是树,则调用对应方法进行换坑\n   7-3. 若该坑位是是链表,遍历这条链表,根据其hash&旧数组长度是0还是1分为两组,一组在新数组下标不变,另一组是原来下标+旧数组长度<br/>\n   注: 因为每次扩容都是2扩容两倍,位运算时只增加一个高位(右数第oldCap个),按位与时,若键值对的右数第oldCap位是0则下标不会受扩容影响,若不是,则下标是原下标加上oldCap.\n\n> 以上分析为个人理解,欢迎指正!\n\n> 关于红黑树的实现与操作并没有深入代码层次解析，有兴趣可阅读\n> [红黑树深入析及Java实现\n> ](https://tech.meituan.com/redblack-tree.html)\n', '\n', 0, '/article/1586759670650', 1586759670368, 1586759670368, 1586759670650, '', 0.11329196468977898, '1', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 0, 0, 0, 0, '', 0, 0, '', 1);
INSERT INTO `wolf_article` VALUES ('1586839356989', 'Java 论坛是做什么的？', '待分类,Q&A', '1586752131583', 1, 10, 'Java论坛是做什么的？\n', '', 0, '/article/1586839356989', 1586839356982, 1586839356982, 1586839389763, 'BlackBox', 0.14507682971925517, '1', 0, 0, 5, 0, 0, 0, 0, 0, 0, '', '47.75.193.76', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 0, 0, 0, 0, '', 20, 0, '', 1);

-- ----------------------------
-- Table structure for wolf_breezemoon
-- ----------------------------
DROP TABLE IF EXISTS `wolf_breezemoon`;
CREATE TABLE `wolf_breezemoon`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `breezemoonContent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '清风明月正文',
  `breezemoonAuthorId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者 id',
  `breezemoonCreated` bigint(20) NOT NULL COMMENT '创建时间',
  `breezemoonUpdated` bigint(20) NOT NULL COMMENT '更新时间',
  `breezemoonIP` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IP',
  `breezemoonUA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'User-Agent',
  `breezemoonStatus` int(11) NOT NULL COMMENT '0：正常，1：封禁',
  `breezemoonCity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布时所在城市',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '清风明月表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_character
-- ----------------------------
DROP TABLE IF EXISTS `wolf_character`;
CREATE TABLE `wolf_character`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `characterUserId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户 id',
  `characterImg` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片 BASE64 编码',
  `characterContent` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_comment
-- ----------------------------
DROP TABLE IF EXISTS `wolf_comment`;
CREATE TABLE `wolf_comment`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `commentContent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回帖正文内容',
  `commentCreateTime` bigint(20) NOT NULL COMMENT '回帖创建时间',
  `commentAuthorId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回帖作者 id',
  `commentOnArticleId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回帖的帖子 id',
  `commentSharpURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回帖带锚点 URL',
  `commentOriginalCommentId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复针对回帖 id，即 父回帖 id',
  `commentStatus` int(11) NOT NULL COMMENT '0：正常，1：封禁',
  `commentIP` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回帖 IP',
  `commentUA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'User-Agent',
  `commentAnonymous` int(11) NOT NULL COMMENT '0：公开回帖，1：匿名回帖',
  `commentThankCnt` int(11) NOT NULL COMMENT '回帖感谢计数',
  `commentGoodCnt` int(11) NOT NULL COMMENT '回帖点赞计数',
  `commentBadCnt` int(11) NOT NULL COMMENT '回帖点踩计数',
  `commentScore` double NOT NULL COMMENT '回帖 Reddit 算法评分',
  `commentReplyCnt` int(11) NOT NULL COMMENT '回复计数',
  `commentAudioURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回帖语音文件 URL',
  `commentQnAOffered` int(11) NOT NULL COMMENT '0：回帖未被采纳，1：回帖已被采纳（仅作用于问答帖）',
  `commentVisible` int(11) NOT NULL COMMENT '0：所有人可见，1：仅楼主和自己可见',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回帖表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_comment
-- ----------------------------
INSERT INTO `wolf_comment` VALUES ('1586765314667', '666 不错呦 ', 1586765314723, '1586751549756', '1586759249983', '/article/1586759249983#1586765314667', '', 0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 0, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `wolf_comment` VALUES ('1586765347535', '很好 ', 1586765347585, '1586751549756', '1586759249983', '/article/1586759249983#1586765347535', '', 0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 0, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `wolf_comment` VALUES ('1586839389766', '专注Java技术分享，促进Java开发领域的知识和创新的传播，解决编程之惑，为程序员服务。 ', 1586839389816, '1586752131583', '1586839356989', '/article/1586839356989#1586839389766', '', 0, '47.75.193.76', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 0, 0, 0, 0, 0, 0, '', 0, 0);

-- ----------------------------
-- Table structure for wolf_domain
-- ----------------------------
DROP TABLE IF EXISTS `wolf_domain`;
CREATE TABLE `wolf_domain`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `domainTitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域标题',
  `domainURI` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域访问路径',
  `domainDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域描述',
  `domainType` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域类型',
  `domainSort` int(11) NOT NULL COMMENT '领域排序',
  `domainNav` int(11) NOT NULL COMMENT '0：作为导航，1：不作为导航',
  `domainTagCnt` int(11) NOT NULL COMMENT '领域标签计数',
  `domainIconPath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域图片路径',
  `domainCSS` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域 CSS',
  `domainStatus` int(11) NOT NULL COMMENT '0：正常，1：封禁',
  `domainSeoTitle` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域 SEO 标题',
  `domainSeoKeywords` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域 SEO 关键字',
  `domainSeoDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域 SEO 描述',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '领域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_domain_tag
-- ----------------------------
DROP TABLE IF EXISTS `wolf_domain_tag`;
CREATE TABLE `wolf_domain_tag`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `domain_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领域 id',
  `tag_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签 id',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '领域 - 标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_emotion
-- ----------------------------
DROP TABLE IF EXISTS `wolf_emotion`;
CREATE TABLE `wolf_emotion`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `emotionUserId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户 Id',
  `emotionContent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表情内容，emoji 的 ASCII，比如 smile',
  `emotionSort` int(11) NOT NULL COMMENT '排序',
  `emotionType` int(11) NOT NULL COMMENT '0：emoji',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户常用表情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_follow
-- ----------------------------
DROP TABLE IF EXISTS `wolf_follow`;
CREATE TABLE `wolf_follow`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `followerId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关注者 id',
  `followingId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关注实体 id',
  `followingType` int(11) NOT NULL COMMENT '0：用户，1：标签，2：帖子收藏，3：帖子关注',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_follow
-- ----------------------------
INSERT INTO `wolf_follow` VALUES ('1586759534678', '1586752131583', '1586751557598', 1);
INSERT INTO `wolf_follow` VALUES ('1586759537255', '1586752131583', '1586751551849', 0);
INSERT INTO `wolf_follow` VALUES ('1586759538867', '1586752131583', '1586751549756', 0);

-- ----------------------------
-- Table structure for wolf_invitecode
-- ----------------------------
DROP TABLE IF EXISTS `wolf_invitecode`;
CREATE TABLE `wolf_invitecode`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请码',
  `generatorId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成者 id',
  `userId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '使用者 id',
  `useTime` bigint(20) NOT NULL COMMENT '使用时间',
  `status` int(11) NOT NULL COMMENT '0：已使用，1：未使用，2：停用',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邀请码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_link
-- ----------------------------
DROP TABLE IF EXISTS `wolf_link`;
CREATE TABLE `wolf_link`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `linkAddrHash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址 Hash https://github.com/b3log/symphony/issues/773',
  `linkAddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `linkTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接标题',
  `linkSubmitCnt` int(11) NOT NULL COMMENT '提交计数',
  `linkClickCnt` int(11) NOT NULL COMMENT '点击计数',
  `linkGoodCnt` int(11) NOT NULL COMMENT '点赞计数',
  `linkBadCnt` int(11) NOT NULL COMMENT '点踩计数',
  `linkBaiduRefCnt` int(11) NOT NULL COMMENT '百度引用计数',
  `linkScore` double NOT NULL COMMENT '评分',
  `linkPingCnt` int(11) NOT NULL COMMENT 'Ping 计数',
  `linkPingErrCnt` int(11) NOT NULL COMMENT 'Ping 失败计数',
  `linkPingTime` bigint(20) NOT NULL COMMENT 'Ping 时间',
  `linkCardHTML` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接卡片 HTML',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_liveness
-- ----------------------------
DROP TABLE IF EXISTS `wolf_liveness`;
CREATE TABLE `wolf_liveness`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `livenessUserId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户 id',
  `livenessDate` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活跃度记录日期',
  `livenessPoint` int(11) NOT NULL COMMENT '积分计数',
  `livenessArticle` int(11) NOT NULL COMMENT '发帖计数',
  `livenessComment` int(11) NOT NULL COMMENT '回帖计数',
  `livenessActivity` int(11) NOT NULL COMMENT '活动计数',
  `livenessThank` int(11) NOT NULL COMMENT '感谢计数',
  `livenessVote` int(11) NOT NULL COMMENT '投票计数',
  `livenessReward` int(11) NOT NULL COMMENT '打赏计数',
  `livenessPV` int(11) NOT NULL COMMENT 'PV 计数',
  `livenessAcceptAnswer` int(11) NOT NULL COMMENT '采纳回答计数',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活跃度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_liveness
-- ----------------------------
INSERT INTO `wolf_liveness` VALUES ('1586751561918', '1586751549756', '20200413', 0, 2, 2, 0, 0, 0, 0, 28, 0);
INSERT INTO `wolf_liveness` VALUES ('1586759252535', '1586752131583', '20200413', 0, 1, 0, 0, 0, 0, 0, 2, 0);
INSERT INTO `wolf_liveness` VALUES ('1586836764725', '1586751549756', '20200414', 0, 0, 0, 0, 0, 0, 0, 2, 0);
INSERT INTO `wolf_liveness` VALUES ('1586839267265', '1586752131583', '20200414', 0, 1, 1, 0, 0, 0, 0, 4, 0);

-- ----------------------------
-- Table structure for wolf_notification
-- ----------------------------
DROP TABLE IF EXISTS `wolf_notification`;
CREATE TABLE `wolf_notification`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `userId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户 id',
  `dataId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据实体 id',
  `dataType` int(11) NOT NULL COMMENT '数据类型',
  `hasRead` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否已读',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_notification
-- ----------------------------
INSERT INTO `wolf_notification` VALUES ('1586751551317', '1586751549756', '', 16, '0');
INSERT INTO `wolf_notification` VALUES ('1586751555029', '1586751551849', '', 16, '0');
INSERT INTO `wolf_notification` VALUES ('1586752601848', '1586752131583', '', 16, '0');
INSERT INTO `wolf_notification` VALUES ('1586759537633', '1586751551849', '1586752131583', 17, '1');
INSERT INTO `wolf_notification` VALUES ('1586759539249', '1586751549756', '1586752131583', 17, '1');
INSERT INTO `wolf_notification` VALUES ('1586765317446', '1586752131583', '1586765314667', 3, '0');
INSERT INTO `wolf_notification` VALUES ('1586765350193', '1586752131583', '1586765347535', 3, '0');

-- ----------------------------
-- Table structure for wolf_operation
-- ----------------------------
DROP TABLE IF EXISTS `wolf_operation`;
CREATE TABLE `wolf_operation`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `operationUserId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作用户 id',
  `operationCode` int(11) NOT NULL COMMENT '具体操作码，具体参考 Operation 模型中的操作码常量定义',
  `operationDataId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作数据 id',
  `operationCreated` bigint(20) NOT NULL COMMENT '操作时间',
  `operationIP` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作 IP',
  `operationUA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'User-Agent',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关键操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_operation
-- ----------------------------
INSERT INTO `wolf_operation` VALUES ('1586767611513', '1586751549756', 12, 'headerBanner', 1586767611365, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36');
INSERT INTO `wolf_operation` VALUES ('1586767839682', '1586751549756', 12, 'adSideFull', 1586767839534, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36');
INSERT INTO `wolf_operation` VALUES ('1586767847724', '1586751549756', 13, 'headerBanner', 1586767847573, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36');

-- ----------------------------
-- Table structure for wolf_option
-- ----------------------------
DROP TABLE IF EXISTS `wolf_option`;
CREATE TABLE `wolf_option`  (
  `oId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `optionValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数配置值',
  `optionCategory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数配置分类',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_option
-- ----------------------------
INSERT INTO `wolf_option` VALUES ('adSideFull', '', 'ad');
INSERT INTO `wolf_option` VALUES ('headerBanner', '', 'ad');
INSERT INTO `wolf_option` VALUES ('miscAllowAddArticle', '0', 'misc');
INSERT INTO `wolf_option` VALUES ('miscAllowAddComment', '0', 'misc');
INSERT INTO `wolf_option` VALUES ('miscAllowAnonymousView', '0', 'misc');
INSERT INTO `wolf_option` VALUES ('miscAllowRegister', '0', 'misc');
INSERT INTO `wolf_option` VALUES ('miscArticleVisitCountMode', '0', 'misc');
INSERT INTO `wolf_option` VALUES ('miscLanguage', 'zh_CN', 'misc');
INSERT INTO `wolf_option` VALUES ('statisticArticleCount', '4', 'statistic');
INSERT INTO `wolf_option` VALUES ('statisticCmtCount', '3', 'statistic');
INSERT INTO `wolf_option` VALUES ('statisticDomainCount', '0', 'statistic');
INSERT INTO `wolf_option` VALUES ('statisticLinkCount', '0', 'statistic');
INSERT INTO `wolf_option` VALUES ('statisticMaxOnlineVisitorCount', '3', 'statistic');
INSERT INTO `wolf_option` VALUES ('statisticMemberCount', '3', 'statistic');
INSERT INTO `wolf_option` VALUES ('statisticTagCount', '7', 'statistic');

-- ----------------------------
-- Table structure for wolf_permission
-- ----------------------------
DROP TABLE IF EXISTS `wolf_permission`;
CREATE TABLE `wolf_permission`  (
  `oId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `permissionCategory` int(11) NOT NULL COMMENT '权限分类',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_permission
-- ----------------------------
INSERT INTO `wolf_permission` VALUES ('adUpdateADSide', 8);
INSERT INTO `wolf_permission` VALUES ('adUpdateBanner', 8);
INSERT INTO `wolf_permission` VALUES ('articleAddArticle', 2);
INSERT INTO `wolf_permission` VALUES ('articleCancelStickArticle', 2);
INSERT INTO `wolf_permission` VALUES ('articleReindexArticle', 2);
INSERT INTO `wolf_permission` VALUES ('articleReindexArticles', 2);
INSERT INTO `wolf_permission` VALUES ('articleRemoveArticle', 2);
INSERT INTO `wolf_permission` VALUES ('articleStickArticle', 2);
INSERT INTO `wolf_permission` VALUES ('articleUpdateArticleBasic', 2);
INSERT INTO `wolf_permission` VALUES ('breezemoonRemoveBreezemoon', 11);
INSERT INTO `wolf_permission` VALUES ('breezemoonUpdateBreezemoon', 11);
INSERT INTO `wolf_permission` VALUES ('commentRemoveComment', 3);
INSERT INTO `wolf_permission` VALUES ('commentUpdateCommentBasic', 3);
INSERT INTO `wolf_permission` VALUES ('commonAddArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonAddArticleAnonymous', 0);
INSERT INTO `wolf_permission` VALUES ('commonAddBreezemoon', 0);
INSERT INTO `wolf_permission` VALUES ('commonAddComment', 0);
INSERT INTO `wolf_permission` VALUES ('commonAddCommentAnonymous', 0);
INSERT INTO `wolf_permission` VALUES ('commonAtParticipants', 0);
INSERT INTO `wolf_permission` VALUES ('commonAtUser', 0);
INSERT INTO `wolf_permission` VALUES ('commonBadArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonBadComment', 0);
INSERT INTO `wolf_permission` VALUES ('commonExchangeIC', 0);
INSERT INTO `wolf_permission` VALUES ('commonFollowArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonGoodArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonGoodComment', 0);
INSERT INTO `wolf_permission` VALUES ('commonRemoveArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonRemoveBreezemoon', 0);
INSERT INTO `wolf_permission` VALUES ('commonRemoveComment', 0);
INSERT INTO `wolf_permission` VALUES ('commonStickArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonThankArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonThankComment', 0);
INSERT INTO `wolf_permission` VALUES ('commonUpdateArticle', 0);
INSERT INTO `wolf_permission` VALUES ('commonUpdateBreezemoon', 0);
INSERT INTO `wolf_permission` VALUES ('commonUpdateComment', 0);
INSERT INTO `wolf_permission` VALUES ('commonUseIL', 0);
INSERT INTO `wolf_permission` VALUES ('commonViewArticleHistory', 0);
INSERT INTO `wolf_permission` VALUES ('commonViewCommentHistory', 0);
INSERT INTO `wolf_permission` VALUES ('commonWatchArticle', 0);
INSERT INTO `wolf_permission` VALUES ('domainAddDomain', 4);
INSERT INTO `wolf_permission` VALUES ('domainAddDomainTag', 4);
INSERT INTO `wolf_permission` VALUES ('domainRemoveDomain', 4);
INSERT INTO `wolf_permission` VALUES ('domainRemoveDomainTag', 4);
INSERT INTO `wolf_permission` VALUES ('domainUpdateDomainBasic', 4);
INSERT INTO `wolf_permission` VALUES ('icGenIC', 7);
INSERT INTO `wolf_permission` VALUES ('icUpdateICBasic', 7);
INSERT INTO `wolf_permission` VALUES ('menuAdmin', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminAD', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminArticles', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminBreezemoons', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminComments', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminDomains', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminIcs', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminMisc', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminReports', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminRoles', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminRWs', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminTags', 10);
INSERT INTO `wolf_permission` VALUES ('menuAdminUsers', 10);
INSERT INTO `wolf_permission` VALUES ('miscAllowAddArticle', 9);
INSERT INTO `wolf_permission` VALUES ('miscAllowAddComment', 9);
INSERT INTO `wolf_permission` VALUES ('miscAllowAnonymousView', 9);
INSERT INTO `wolf_permission` VALUES ('miscLanguage', 9);
INSERT INTO `wolf_permission` VALUES ('miscRegisterMethod', 9);
INSERT INTO `wolf_permission` VALUES ('rwAddReservedWord', 6);
INSERT INTO `wolf_permission` VALUES ('rwRemoveReservedWord', 6);
INSERT INTO `wolf_permission` VALUES ('rwUpdateReservedWordBasic', 6);
INSERT INTO `wolf_permission` VALUES ('tagUpdateTagBasic', 5);
INSERT INTO `wolf_permission` VALUES ('userAddPoint', 1);
INSERT INTO `wolf_permission` VALUES ('userAddUser', 1);
INSERT INTO `wolf_permission` VALUES ('userDeductPoint', 1);
INSERT INTO `wolf_permission` VALUES ('userExchangePoint', 1);
INSERT INTO `wolf_permission` VALUES ('userUpdateUserAdvanced', 1);
INSERT INTO `wolf_permission` VALUES ('userUpdateUserBasic', 1);

-- ----------------------------
-- Table structure for wolf_pointtransfer
-- ----------------------------
DROP TABLE IF EXISTS `wolf_pointtransfer`;
CREATE TABLE `wolf_pointtransfer`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `fromId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '源账户 id',
  `toId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目标账户 id',
  `sum` int(11) NOT NULL COMMENT '转账金额',
  `fromBalance` int(11) NOT NULL COMMENT '源账户余额',
  `toBalance` int(11) NOT NULL COMMENT '目标账户余额',
  `time` bigint(20) NOT NULL COMMENT '转账时间',
  `type` int(11) NOT NULL COMMENT '转账类型',
  `dataId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据实体 id',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分转账表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_pointtransfer
-- ----------------------------
INSERT INTO `wolf_pointtransfer` VALUES ('1586751550522', 'sys', '1586751549756', 500, 0, 500, 1586751550202, 0, '1586751549756', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586751554239', 'sys', '1586751551849', 500, 0, 500, 1586751553925, 0, '1586751551849', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586751561480', '1586751549756', 'sys', 20, 480, 0, 1586751561236, 1, '1586751559998', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586752601128', 'sys', '1586752131583', 500, 0, 500, 1586752600888, 0, '1586752131583', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586759252083', '1586752131583', 'sys', 20, 480, 0, 1586759251789, 1, '1586759249983', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586759673074', '1586751549756', 'sys', 21, 459, 0, 1586759672848, 1, '1586759670650', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586765316132', '1586751549756', '1586752131583', 5, 454, 485, 1586765315778, 3, '1586765314667', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586765348914', '1586751549756', '1586752131583', 5, 449, 490, 1586765348558, 3, '1586765347535', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586839357695', '1586752131583', 'sys', 20, 470, 0, 1586839357691, 1, '1586839356989', '');
INSERT INTO `wolf_pointtransfer` VALUES ('1586839389895', '1586752131583', 'sys', 2, 468, 0, 1586839389889, 3, '1586839389766', '');

-- ----------------------------
-- Table structure for wolf_referral
-- ----------------------------
DROP TABLE IF EXISTS `wolf_referral`;
CREATE TABLE `wolf_referral`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `referralUser` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推介用户名',
  `referralDataId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据实体 id',
  `referralType` int(11) NOT NULL COMMENT '0：帖子',
  `referralIP` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '点击 IP',
  `referralClick` int(11) NOT NULL COMMENT '推介点击计数',
  `referralUserHasPoint` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `referralAuthorHasPoint` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '推介记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_referral
-- ----------------------------
INSERT INTO `wolf_referral` VALUES ('1586836831937', 'wolf', '1586759249983', 0, '127.0.0.1', 1, '0', '0');

-- ----------------------------
-- Table structure for wolf_report
-- ----------------------------
DROP TABLE IF EXISTS `wolf_report`;
CREATE TABLE `wolf_report`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `reportUserId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '举报人 id',
  `reportDataId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '举报数据 id',
  `reportDataType` int(11) NOT NULL COMMENT '0：帖子，1：回帖，2：用户',
  `reportType` int(11) NOT NULL COMMENT '0：（内容）垃圾广告，1：（内容）色情低俗，2：（内容）违法违规，3：（内容）涉嫌侵权，4：（内容）人身攻击，5：（用户）冒充账号，6：（用户）垃圾广告账号，7：（用户）个人信息违规，49：其他',
  `reportMemo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '举报情况备注',
  `reportHandled` int(11) NOT NULL COMMENT '0：未处理，1：已处理',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '举报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_revision
-- ----------------------------
DROP TABLE IF EXISTS `wolf_revision`;
CREATE TABLE `wolf_revision`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `revisionDataType` int(11) NOT NULL COMMENT '0：帖子，1：回帖',
  `revisionDataId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据实体 id',
  `revisionData` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修订数据',
  `revisionAuthorId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者 id',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '修订变更表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_revision
-- ----------------------------
INSERT INTO `wolf_revision` VALUES ('1586751560830', 0, '1586751559998', '{\"articleTitle\":\"欢迎来到  Java 论坛 :Java 开发者的网上家园\",\"articleContent\":\"Java论坛，专注Java技术分享，促进Java开发领域的知识和创新的传播，解决编程之惑，为程序员服务。\"}', '1586751549756');
INSERT INTO `wolf_revision` VALUES ('1586759251350', 0, '1586759249983', '{\"articleTitle\":\"ConcurrentHashMap 源码分析（基于 jdk1.8）\",\"articleContent\":\"```\\n# ConcurrentHashMap源码分析（基于jdk1.8）\\n\\n# 简介\\n\\n1.8版本的并发HashMap相较与1.7的版本，去掉了分段锁，每次操作都在hash table的一个桶位上进行cas或加锁操作，细化了加锁粒度，提高并发能力。初次之外，在哈希冲突处理方面更新了增到8转红黑树，减到6转链表。ConcurrentHashMap 大量采用CAS的算法。\\n\\n\\n\\n We do not want to waste the space required to associate a distinct lock object with each bin, so instead use the first node of a bin list itself as a lock. Locking support for these locks relies on builtin \\\"synchronized\\\" monitors.\\n\\n The main disadvantage of per-bin locks is that other update operations on other nodes in a bin list protected by the same lock can stall\\n\\n public class ConcurrentHashMap<K,V> extends AbstractMap<K,V>\\n    implements ConcurrentMap<K,V>, Serializable {\\n    }\\n\\n### 类属性\\n\\n+ private static final int MAXIMUM_CAPACITY = 1 << 30; \\n\\n    table桶数最大值，前两位用作控制标志\\n\\n\\n+ private static final int DEFAULT_CAPACITY = 16;\\n\\n    table桶数初始化默认值，需为2的幂次方\\n    /**\\n     * The largest possible (non-power of two) array size.\\n     * Needed by toArray and related methods.\\n     */\\n+ static final int MAX_ARRAY_SIZE = Integer.MAX_VALUE - 8;\\n\\n\\n+ private static final float LOAD_FACTOR = 0.75f;\\n\\n    加载因子，扩容的阀值，可在构造方法定义\\n\\n\\n+ static final int TREEIFY_THRESHOLD = 8;\\n\\n    树化阀值1，当链表节点超过8允许转化为红黑树\\n\\n+ static final int UNTREEIFY_THRESHOLD = 6;\\n\\n    链化阀值1，当树节点小于6则转化为链表\\n\\n+ static final int MIN_TREEIFY_CAPACITY = 64;\\n\\n    树化阀值2，当数组桶树达到64以上才允许链表树化\\n\\n+ private static final int MIN_TRANSFER_STRIDE = 16;\\n\\n    链化阀值2，与上类似\\n\\n    /**\\n     * The number of bits used for generation stamp in sizeCtl.\\n     * Must be at least 6 for 32bit arrays.\\n     */\\n    private static int RESIZE_STAMP_BITS = 16;\\n\\n    /**\\n     * The maximum number of threads that can help resize.\\n     * Must fit in 32 - RESIZE_STAMP_BITS bits.\\n     */\\n    private static final int MAX_RESIZERS = (1 << (32 - RESIZE_STAMP_BITS)) - 1;\\n\\n    /**\\n     * The bit shift for recording size stamp in sizeCtl.\\n     */\\n    private static final int RESIZE_STAMP_SHIFT = 32 - RESIZE_STAMP_BITS;\\n\\n    /*\\n     * Encodings for Node hash fields. See above for explanation.\\n     */\\n    static final int MOVED     = -1; // hash for forwarding nodes\\n    static final int TREEBIN   = -2; // hash for roots of trees\\n    static final int RESERVED  = -3; // hash for transient reservations\\n    static final int HASH_BITS = 0x7fffffff; // usable bits of normal node hash\\n\\n    /** Number of CPUS, to place bounds on some sizings */\\n    static final int NCPU = Runtime.getRuntime().availableProcessors();\\n\\n\\n## 主要的内部类\\n\\n### Node\\n\\n+ final保证线程安全性 volatile保证线程间修改（update）的可见性\\n\\n    static class Node<K,V> implements Map.Entry<K,V> {\\n        // 键值对的hash计算值\\n        final int hash;\\n        final K key;\\n        volatile V val;\\n        // 下一个节点，链表法解决冲突\\n        volatile Node<K,V> next;\\n    }\\n\\n## 对象属性\\n\\n+ transient volatile Node<K,V>[] table;\\n\\n    桶数组，数组长度为2的幂次方\\n\\n+ private transient volatile Node<K,V>[] nextTable;\\n\\n    resize操作使用的桶数组\\n\\n    /**\\n     * Base counter value, used mainly when there is no contention,\\n     * but also as a fallback during table initialization\\n     * races. Updated via CAS.\\n     */\\n    private transient volatile long baseCount;\\n\\n    /**\\n     * Table initialization and resizing control.  When negative, the\\n     * table is being initialized or resized: -1 for initialization,\\n     * else -(1 + the number of active resizing threads).  Otherwise,\\n     * when table is null, holds the initial table size to use upon\\n     * creation, or 0 for default. After initialization, holds the\\n     * next element count value upon which to resize the table.\\n     */\\n    private transient volatile int sizeCtl;\\n\\n    /**\\n     * The next table index (plus one) to split while resizing.\\n     */\\n    private transient volatile int transferIndex;\\n\\n    /**\\n     * Spinlock (locked via CAS) used when resizing and/or creating CounterCells.\\n     */\\n    private transient volatile int cellsBusy;\\n\\n    /**\\n     * Table of counter cells. When non-null, size is a power of 2.\\n     */\\n    private transient volatile CounterCell[] counterCells;\\n\\n+ private transient KeySetView<K,V> keySet;<br/>private transient ValuesView<K,V> values;<br/>private transient EntrySetView<K,V> entrySet;\\n\\n    数据视图\\n\\n\\n## 主要的几个方法\\n\\n### spread\\n\\n再散列，通过哈希吗的高位与低位抑或，使K-V的分布更均匀。HASH_BITS为7fffffff,通过与其相与保障最高位为0，避免出现ffff0000^0000ffff=ffffffff发送数组越界的情况\\n\\n    static final int spread(int h) {\\n        return (h ^ (h >>> 16)) & HASH_BITS;\\n    }\\n\\n\\n### get\\n\\n    // 与HashMap不同，key不能为Null\\n    public V get(Object key) {\\n        Node<K,V>[] tab; Node<K,V> e, p; int n, eh; K ek;\\n        // spread通过高位参与运算，获取数组的桶位\\n        int h = spread(key.hashCode());\\n        if ((tab = table) != null && (n = tab.length) > 0 &&\\n            // 取出该桶位的第一个节点\\n            (e = tabAt(tab, (n - 1) & h)) != null) {\\n            // 若第一个节点就是当前key，直接返回第一个节点的val\\n            if ((eh = e.hash) == h) {\\n                if ((ek = e.key) == key || (ek != null && key.equals(ek)))\\n                    return e.val;\\n            }\\n            // 在冲突解决的数据结构中查找节点并返回其val\\n            // eh<0 --> hash最高位为1，代表当前桶位冲突解决使用的是红黑树，find查找\\n            else if (eh < 0)\\n                return (p = e.find(h, key)) != null ? p.val : null;\\n            // eh<0 --> hash最高位为0，代表当前桶位冲突解决使用的是链表，直接遍历查询\\n            while ((e = e.next) != null) {\\n                if (e.hash == h &&\\n                    ((ek = e.key) == key || (ek != null && key.equals(ek))))\\n                    return e.val;\\n            }\\n        }\\n        return null;\\n    }\\n\\n### put\\n\\nput实际实现为putVal，增加一个参数，判断是否覆盖原有的K-V\\n\\nKey和Value都不能为Null\\n\\n    /**\\n     * Maps the specified key to the specified value in this table.\\n     * Neither the key nor the value can be null.\\n     *\\n     * <p>The value can be retrieved by calling the {@code get} method\\n     * with a key that is equal to the original key.\\n     */\\n    public V put(K key, V value) {\\n        return putVal(key, value, false);\\n    }\\n  \\n    /** Implementation for put and putIfAbsent */\\n    final V putVal(K key, V value, boolean onlyIfAbsent) {\\n        if (key == null || value == null) throw new NullPointerException();\\n        int hash = spread(key.hashCode());\\n        int binCount = 0;\\n        for (Node<K,V>[] tab = table;;) {\\n            Node<K,V> f; int n, i, fh;\\n            // 若桶数组仍未初始化，则先初始化数组\\n            if (tab == null || (n = tab.length) == 0)\\n                tab = initTable();\\n            // 若该桶位无头节点，则通过CAS操作插入桶位，退出循环\\n            else if ((f = tabAt(tab, i = (n - 1) & hash)) == null) {\\n                if (casTabAt(tab, i, null,\\n                             new Node<K,V>(hash, key, value, null)))\\n                    break;                   // no lock when adding to empty bin\\n            }\\n            // 查看该头节点状态，若为MOVED（当前正在resize操作），执行helpTransfer帮助resize\\n            else if ((fh = f.hash) == MOVED)\\n                tab = helpTransfer(tab, f);\\n            // 当前头节点已经存在或者CAS操作失败，对头结点synchronized加对象锁，执行冲突解决\\n            else {\\n                V oldVal = null;\\n                synchronized (f) {\\n                    // 双重检查\\n                    if (tabAt(tab, i) == f) {\\n                        // 若是链表\\n                        if (fh >= 0) {\\n                            binCount = 1;\\n                            for (Node<K,V> e = f;; ++binCount) {\\n                                K ek;\\n                                if (e.hash == hash &&\\n                                    ((ek = e.key) == key ||\\n                                     (ek != null && key.equals(ek)))) {\\n                                    oldVal = e.val;\\n                                    // 发现插入Key已存在，根据onlyIfAbsent执行覆盖\\n                                    if (!onlyIfAbsent)\\n                                        e.val = value;\\n                                    break;\\n                                }\\n                                Node<K,V> pred = e;\\n                                // 没有相同的Key,接入链表尾部\\n                                if ((e = e.next) == null) {\\n                                    pred.next = new Node<K,V>(hash, key,\\n                                                              value, null);\\n                                    break;\\n                                }\\n                            }\\n                        }\\n                        // 若是红黑树\\n                        else if (f instanceof TreeBin) {\\n                            Node<K,V> p;\\n                            binCount = 2;\\n                            if ((p = ((TreeBin<K,V>)f).putTreeVal(hash, key,\\n                                                           value)) != null) {\\n                                oldVal = p.val;\\n                                if (!onlyIfAbsent)\\n                                    p.val = value;\\n                            }\\n                        }\\n                    }\\n                }\\n                // bitCount为链插入后的长度,达到阀值就执行树化操作\\n                if (binCount != 0) {\\n                    if (binCount >= TREEIFY_THRESHOLD)\\n                        treeifyBin(tab, i);\\n                    if (oldVal != null)\\n                        return oldVal;\\n                    break;\\n                }\\n            }\\n        }\\n        // K-V计数加一\\n        addCount(1L, binCount);\\n        return null;\\n    }\\n\\n### size\\n\\nsize操作返回的值来自于CounterCell[]中元素值之和，其中的元素改动又来自于addCount方法\\n\\n可知CounterCell[]其中每个元素代表着桶数组中每个元素内的节点数\\n\\n    /**\\n     * {@inheritDoc}\\n     */\\n    public int size() {\\n        long n = sumCount();\\n        return ((n < 0L) ? 0 :\\n                (n > (long)Integer.MAX_VALUE) ? Integer.MAX_VALUE :\\n                (int)n);\\n    }\\n  \\n     @sun.misc.Contended static final class CounterCell {\\n        volatile long value;\\n        CounterCell(long x) { value = x; }\\n    }\\n  \\n    final long sumCount() {\\n        CounterCell[] as = counterCells; CounterCell a;\\n        long sum = baseCount;\\n        if (as != null) {\\n            for (int i = 0; i < as.length; ++i) {\\n                if ((a = as[i]) != null)\\n                    sum += a.value;\\n            }\\n        }\\n        return sum;\\n    }\\n\\n### resize\\n\\n\\n```\\n\"}', '1586752131583');
INSERT INTO `wolf_revision` VALUES ('1586759671895', 0, '1586759670650', '{\"articleTitle\":\"HashMap 源码解析 (jdk8 版)\",\"articleContent\":\"HashMap源码解析(jdk8版)\\n\\nHashMap允许key为null,也允许value为null<br/>\\n\\nHashMap与HashTable两个类是差不多的,除了HashTable是线程安全且不允许null值这一点外.\\n\\n基本概念:HashMap底层是数组+链表(数组的每个值都是一条链表的头结点),1.8后加入了红黑树(当链表长度达到8就自动将该链表替换为红黑树),通过计算key的哈希码,在经过高位参与位运算计算得出键值对(将key和value包装起来的对象)所在的数组的下标,采用头插入法插入该位置的链表(若该位置是空的就直接插入)\\n\\n## HashMap的相关域:\\n\\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    static final int DEFAULT_INITIAL_CAPACITY = 1 << 4; \\n\\n    static final int MAXIMUM_CAPACITY = 1 << 30;\\n\\n    static final float DEFAULT_LOAD_FACTOR = 0.75f;\\n\\n    static final int TREEIFY_THRESHOLD = 8;\\n\\n    static final int UNTREEIFY_THRESHOLD = 6;\\n\\n    static final int MIN_TREEIFY_CAPACITY = 64;\\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n+ DEFAULT_INITIAL_CAPACITY: 默认底层数组的初始大小(2^4),可通过构造参数指定\\n+ MAXIMUM_CAPACITY: 数组的最大长度(2^31),超过将替换为此值\\n+ DEFAULT_LOAD_FACTOR: 默认负载因子,为0.75,可通过构造参数指定\\n+ TREEIFY_THRESHOLD: 链表转换为红黑树的阙值,当链表长度达到8自动转为红黑树进行存储(前提是数组长度大于等于64)\\n+ UNTREEIFY_THRESHOLD: 红黑树转为链表的阙值,当红黑树结点个数减小到6时,自动转为链表存储\\n+ MIN_TREEIFY_CAPACITY: 链表进行树化的前提条件,数组长度要达到64或一上,在这之前只能通过数组扩容来减少链表长度\\n\\n  `````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    transient Node<K,V>[] table;\\n\\n    transient Set<Map.Entry<K,V>> entrySet;\\n\\n    transient int size;\\n\\n    transient int modCount;\\n\\n    int threshold;\\n\\n    final float loadFactor;\\n  `````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n+ table: 底层数组,可动态扩容,数组长度为2的整数次方\\n+ size: 这个map中存放的键值对数目\\n+ modCount: 记录这个map数据结构发生改变的次数(发送插入删除或者链表与树相互转换的操作),由于fail-fast机制\\n+ threshold: 数组进行扩容的下个阙值(当前键值对数量达到这个值后进行 `resize()`(扩容)操作)(threshold = capacity * load factor)\\n+ loadFactor:　实际的负载因子\\n\\n## 哈希码计算方法 `hash(Object key)`\\n\\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    static final int hash(Object key) {\\n        int h;\\n        return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);\\n    }\\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n+ 局部变量h存放hashCode()放回的初始哈希码,通过h右移16位与h异或(右移后,前16位为0,异或不改变h的前16位值)得到最终的哈希吗.<br/>\\n  通过高位参与位运算可以减少数组长度较低时的哈希码冲突问题(取模时,高位变低位不变,冲突几率会变高)\\n\\n## 链表结点的数据结构 `Node<K,V>`\\n\\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    static class Node<K,V> implements Map.Entry<K,V> {\\n        final int hash; // 计算得到的hash码\\n        final K key;    // 键对象\\n        V value;        // 值对象\\n        Node<K,V> next; // 下一个结点\\n        方法略...\\n    }\\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n## 树节点数据结构v `TreeNode<K,V>`\\n\\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    static final class TreeNode<K,V> extends LinkedHashMap.Entry<K,V> {\\n        TreeNode<K,V> parent;  // 父亲节点\\n        TreeNode<K,V> left;    // 左子树\\n        TreeNode<K,V> right;   //右子树\\n        TreeNode<K,V> prev;    // needed to unlink next upon deletion\\n        boolean red;            // 红色还是黑色\\n        TreeNode(int hash, K key, V val, Node<K,V> next) {\\n            super(hash, key, val, next);\\n        方法略...  \\n    }\\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n+ 通过继承 `LinkedHashMap.Entry<K,V>`,实际上间接继承了链表的 `Node<K,V>`\\n\\n## 获取value:get(Object key)\\n\\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    public V get(Object key) {\\n        Node<K,V> e;\\n        return (e = getNode(hash(key), key)) == null ? null : e.value;      //1\\n    }\\n\\n    final Node<K,V> getNode(int hash, Object key) {\\n        Node<K,V>[] tab;\\n        Node<K,V> first, e;\\n        int n;\\n        K k;\\n        if ((tab = table) != null && (n = tab.length) > 0 &&\\n            (first = tab[(n - 1) & hash]) != null) {                        //2\\n            if (first.hash == hash && // always check first node\\n                ((k = first.key) == key || (key != null && key.equals(k)))) //3\\n                return first;\\n            if ((e = first.next) != null) {                                 //4\\n                if (first instanceof TreeNode)\\n                    return ((TreeNode<K,V>)first).getTreeNode(hash, key);\\n                do {\\n                    if (e.hash == hash &&\\n                        ((k = e.key) == key || (key != null && key.equals(k))))\\n                        return e;\\n                } while ((e = e.next) != null);\\n            }\\n        }\\n        return null;\\n    }\\n`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n1. 计算key的哈希码,传入getNode方法,放回Node对象或者null\\n2. 如果table为null,table是空的或者数组( (length-1)&hash )处的值为null,就返回null,否则进入3\\n3. 检查第一个结点,若是指定的key,直接返回该结点,否则进入4\\n4. 如果这个树/链表不止一个结点,先判断是树还是链表,再进行对应的结点查找,找到就返回,否则返回null.\\n\\n## 增加键值对 `put(K key, V value)`\\n\\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    public V put(K key, V value) {\\n        return putVal(hash(key), key, value, false, true);\\n    }\\n\\n    /**\\n    * Implements Map.put and related methods\\n    *\\n    * @param hash hash for key\\n    * @param key the key\\n    * @param value the value to put\\n    * @param onlyIfAbsent if true, don\'t change existing value\\n    * @param evict if false, the table is in creation mode.\\n    * @return previous value, or null if none\\n    */\\n    final V putVal(int hash, K key, V value, boolean onlyIfAbsent,\\n                boolean evict) {\\n        Node<K,V>[] tab;\\n        Node<K,V> p;\\n        int n, i;\\n        if ((tab = table) == null || (n = tab.length) == 0)             //1\\n            n = (tab = resize()).length;\\n        if ((p = tab[i = (n - 1) & hash]) == null)                      //2\\n            tab[i] = newNode(hash, key, value, null);\\n        else {\\n            Node<K,V> e; K k;\\n            if (p.hash == hash &&\\n                ((k = p.key) == key || (key != null && key.equals(k)))) //3\\n                e = p;\\n            else if (p instanceof TreeNode)                             //4\\n                e = ((TreeNode<K,V>)p).putTreeVal(this, tab, hash, key, value);\\n            else {                                                      //5\\n                for (int binCount = 0; ; ++binCount) {\\n                    if ((e = p.next) == null) {                   \\n                        p.next = newNode(hash, key, value, null);\\n                        if (binCount >= TREEIFY_THRESHOLD - 1) // -1 for 1st\\n                            treeifyBin(tab, hash);\\n                        break;\\n                    }\\n                    if (e.hash == hash &&\\n                        ((k = e.key) == key || (key != null && key.equals(k))))\\n                        break;\\n                    p = e;\\n                }\\n            }\\n            if (e != null) { // existing mapping for key                //6\\n                V oldValue = e.value;\\n                if (!onlyIfAbsent || oldValue == null)\\n                    e.value = value;\\n                afterNodeAccess(e);\\n                return oldValue;\\n            }\\n        }                                                               //7\\n        ++modCount;\\n        if (++size > threshold)\\n            resize();\\n        afterNodeInsertion(evict);\\n        return null;\\n    }\\n```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n1. 如果数组为null或是空的,则 `resize()`扩充容量\\n2. 通过hash计算并位运算取摸获得数组下标,若该位置是空的,新建链表结点直接填坑然后跳到7,否则进入3\\n3. 判断头结点的key跟要put进去的key是否同一个,是则将其引用赋给e,进入6,否则进入4\\n4. 判断头结点是不是树结点,是则执行 `putTreeVal`,若树中已存在该key,则直接返回该键值对(赋给e),否则新建并插入结点并返回null,然后进入6.如果不是树节点则进入5\\n5. 在链表中遍历,如果不存在,就新建一个结点,然后是否达到树化的阙值,是就转化为树结构,之后跳到7.如果存在就把它的引用赋给e跳到6\\n6. 在搜索到当前map中存在相同key时候将该键值对赋给e,在这里进行值的覆盖,并返回旧值\\n7. 对改动进行计数,判断是否需要进行数组扩容,返回null\\n\\n## 移除键值对 `remove(Object key)`\\n\\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    public V remove(Object key) {\\n        Node<K,V> e;\\n        return (e = removeNode(hash(key), key, null, false, true)) == null ?\\n            null : e.value;\\n    }\\n\\n    final Node<K,V> removeNode(int hash, Object key, Object value,\\n                            boolean matchValue, boolean movable) {\\n        Node<K,V>[] tab;\\n        Node<K,V> p;\\n        int n,index;\\n        if ((tab = table) != null && (n = tab.length) > 0 &&            //1\\n            (p = tab[index = (n - 1) & hash]) != null) {\\n            Node<K,V> node = null, e;\\n            K k;\\n            V v;\\n            if (p.hash == hash &&\\n                ((k = p.key) == key || (key != null && key.equals(k)))) //2\\n                node = p;\\n            else if ((e = p.next) != null) {                            //3\\n                if (p instanceof TreeNode)\\n                    node = ((TreeNode<K,V>)p).getTreeNode(hash, key);\\n                else {\\n                    do {\\n                        if (e.hash == hash &&\\n                            ((k = e.key) == key ||\\n                            (key != null && key.equals(k)))) {\\n                            node = e;\\n                            break;\\n                        }\\n                        p = e;\\n                    } while ((e = e.next) != null);\\n                }\\n            }\\n            if (node != null && (!matchValue || (v = node.value) == value ||    //4\\n                                (value != null && value.equals(v)))) {\\n                if (node instanceof TreeNode)\\n                    ((TreeNode<K,V>)node).removeTreeNode(this, tab, movable);\\n                else if (node == p)\\n                    tab[index] = node.next;\\n                else\\n                    p.next = node.next;\\n                ++modCount;\\n                --size;\\n                afterNodeRemoval(node);\\n                return node;\\n            }\\n        }\\n        return null;\\n    }\\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n1. 判断底层数组是否为null或者是空的,是就直接返回null,否则2\\n2. 判断头结点是否就是要移除的键值对,是就赋给e,进入4,否则进入3\\n3. 判断是树还是链表并进行相应遍历,找到符合的键值对,并赋给e,进入4,若查无,返回null\\n4. 针对不同的存储结构进行相应的移除操作,并更新相关的计数值\\n\\n## 链表的树化操作 `treeifyBin(Node<K,V>[] tab, int hash)`\\n\\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n    /**\\n    * Replaces all linked nodes in bin at index for given hash unless\\n    * table is too small, in which case resizes instead.\\n    */\\n    final void treeifyBin(Node<K,V>[] tab, int hash) {\\n        int n, index; Node<K,V> e;\\n        if (tab == null || (n = tab.length) < MIN_TREEIFY_CAPACITY)\\n            resize();\\n        else if ((e = tab[index = (n - 1) & hash]) != null) {\\n            TreeNode<K,V> hd = null, tl = null;\\n            do {\\n                TreeNode<K,V> p = replacementTreeNode(e, null);\\n                if (tl == null)\\n                    hd = p;\\n                else {\\n                    p.prev = tl;\\n                    tl.next = p;\\n                }\\n                tl = p;\\n            } while ((e = e.next) != null);\\n            if ((tab[index] = hd) != null)\\n                hd.treeify(tab);\\n        }\\n    }\\n````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````\\n\\n+ 先将链表结点转化成树结点,构造成双向链表,在 `treeify`进行红黑树的构造\\n\\n## 扩容操作 `resize`\\n\\n[] newTab = (Nodek,v[])new Node[newCap];\\n        table = newTab;\\n        if (oldTab != null) {                                                   // 7\\n            for (int j = 0; j < oldCap; ++j) {\\n                Nodek,v e;\\n                if ((e = oldTab[j]) != null) {\\n                    oldTab[j] = null;\\n                    if (e.next == null)                                         // 7-1\\n                        newTab[e.hash & (newCap - 1)] = e;\\n                    else if (e instanceof TreeNode)                             // 7-2\\n                        ((TreeNodek,v)e).split(this, newTab, j, oldCap);\\n                    else { // preserve order                                    // 7-3\\n                        Nodek,v loHead = null, loTail = null;\\n                        Nodek,v hiHead = null, hiTail = null;\\n                        Nodek,v next;\\n                        do {\\n                            next = e.next;\\n                            if ((e.hash & oldCap) == 0) {\\n                                if (loTail == null)\\n                                    loHead = e;\\n                                else\\n                                    loTail.next = e;\\n                                loTail = e;\\n                            }\\n                            else {\\n                                if (hiTail == null)\\n                                    hiHead = e;\\n                                else\\n                                    hiTail.next = e;\\n                                hiTail = e;\\n                            }\\n                        } while ((e = next) != null);\\n                        if (loTail != null) {\\n                            loTail.next = null;\\n                            newTab[j] = loHead;\\n                        }\\n                        if (hiTail != null) {\\n                            hiTail.next = null;\\n                            newTab[j + oldCap] = hiHead;\\n                        }\\n                    }\\n                }\\n            }\\n        }\\n        return newTab;\\n    }\\n\\\">\\n```\\n    /**\\n    * Initializes or doubles table size.  If null, allocates in\\n    * accord with initial capacity target held in field threshold.\\n    * Otherwise, because we are using power-of-two expansion, the\\n    * elements from each bin must either stay at same index, or move\\n    * with a power of two offset in the new table.\\n    *\\n    * @return the table\\n    */\\n    final Node<K,V>[] resize() {\\n        Node<K,V>[] oldTab = table;\\n        int oldCap = (oldTab == null) ? 0 : oldTab.length;\\n        int oldThr = threshold;\\n        int newCap, newThr = 0;\\n        if (oldCap > 0) {\\n            if (oldCap >= MAXIMUM_CAPACITY) {                           // 1\\n                threshold = Integer.MAX_VALUE;\\n                return oldTab;\\n            }\\n            else if ((newCap = oldCap << 1) < MAXIMUM_CAPACITY &&       // 2\\n                    oldCap >= DEFAULT_INITIAL_CAPACITY)\\n                newThr = oldThr << 1; // double threshold\\n        }\\n        else if (oldThr > 0) // initial capacity was placed in threshold    // 3\\n            newCap = oldThr;\\n        else {               // zero initial threshold signifies using defaults // 4\\n            newCap = DEFAULT_INITIAL_CAPACITY;\\n            newThr = (int)(DEFAULT_LOAD_FACTOR * DEFAULT_INITIAL_CAPACITY);\\n        }\\n        if (newThr == 0) {                                                      // 5\\n            float ft = (float)newCap * loadFactor;\\n            newThr = (newCap < MAXIMUM_CAPACITY && ft < (float)MAXIMUM_CAPACITY ?\\n                    (int)ft : Integer.MAX_VALUE);\\n        }\\n        threshold = newThr;                                                     // 6\\n        @SuppressWarnings({\\\"rawtypes\\\",\\\"unchecked\\\"})\\n            Node<K,V>[] newTab = (Node<K,V>[])new Node[newCap];\\n        table = newTab;\\n        if (oldTab != null) {                                                   // 7\\n            for (int j = 0; j < oldCap; ++j) {\\n                Node<K,V> e;\\n                if ((e = oldTab[j]) != null) {\\n                    oldTab[j] = null;\\n                    if (e.next == null)                                         // 7-1\\n                        newTab[e.hash & (newCap - 1)] = e;\\n                    else if (e instanceof TreeNode)                             // 7-2\\n                        ((TreeNode<K,V>)e).split(this, newTab, j, oldCap);\\n                    else { // preserve order                                    // 7-3\\n                        Node<K,V> loHead = null, loTail = null;\\n                        Node<K,V> hiHead = null, hiTail = null;\\n                        Node<K,V> next;\\n                        do {\\n                            next = e.next;\\n                            if ((e.hash & oldCap) == 0) {\\n                                if (loTail == null)\\n                                    loHead = e;\\n                                else\\n                                    loTail.next = e;\\n                                loTail = e;\\n                            }\\n                            else {\\n                                if (hiTail == null)\\n                                    hiHead = e;\\n                                else\\n                                    hiTail.next = e;\\n                                hiTail = e;\\n                            }\\n                        } while ((e = next) != null);\\n                        if (loTail != null) {\\n                            loTail.next = null;\\n                            newTab[j] = loHead;\\n                        }\\n                        if (hiTail != null) {\\n                            hiTail.next = null;\\n                            newTab[j + oldCap] = hiHead;\\n                        }\\n                    }\\n                }\\n            }\\n        }\\n        return newTab;\\n    }\\n```\\n\\n1. 若底层数组长度大于等于允许的最大值,将扩容阙值设为MAX_INT,直接不做任何操作,直接返回原数组\\n2. 如果底层数组长度是大于默认初始长度且当前长度*2小于允许的最大值,则将新的数组长度,扩容阙值都设为原来的两倍\\n3. 当前数组未初始化,且扩容阙值已经初始化(不为0),将新的数组长度设定为扩容阙值,跳到5\\n4. 当前数组与扩容阙值都未初始化,将新的数组长度和扩容阙值设为默认初始值\\n5. 根据新的数组长度值计算新的扩容阙值,如果新的数组长度值或者新的阙值大于数组长度的允许最大值,则将其替换为MAX_INT,反之保留\\n6. 将经过上述计算得到的新值进行更新(设置threshold为新值, 实例化一个新长度的底层数组)\\n7. 遍历数组的每个坑位,将老数组的值搬运到新的数组中\\n   7-1. 若该坑位只有一个结点,直接搬运到新数组对应坑位,需要重新计算下标,因为新数组的长度已经改变\\n   7-2. 若该坑位放的是树,则调用对应方法进行换坑\\n   7-3. 若该坑位是是链表,遍历这条链表,根据其hash&旧数组长度是0还是1分为两组,一组在新数组下标不变,另一组是原来下标+旧数组长度<br/>\\n   注: 因为每次扩容都是2扩容两倍,位运算时只增加一个高位(右数第oldCap个),按位与时,若键值对的右数第oldCap位是0则下标不会受扩容影响,若不是,则下标是原下标加上oldCap.\\n\\n> 以上分析为个人理解,欢迎指正!\\n\\n> 关于红黑树的实现与操作并没有深入代码层次解析，有兴趣可阅读\\n> [红黑树深入析及Java实现\\n> ](https://tech.meituan.com/redblack-tree.html)\\n\"}', '1586751549756');
INSERT INTO `wolf_revision` VALUES ('1586765315490', 1, '1586765314667', '{\"commentContent\":\"666 不错呦 \"}', '1586751549756');
INSERT INTO `wolf_revision` VALUES ('1586765348288', 1, '1586765347535', '{\"commentContent\":\"很好 \"}', '1586751549756');
INSERT INTO `wolf_revision` VALUES ('1586839357449', 0, '1586839356989', '{\"articleTitle\":\"Java 论坛是做什么的？\",\"articleContent\":\"Java论坛是做什么的？\\n\"}', '1586752131583');
INSERT INTO `wolf_revision` VALUES ('1586839389832', 1, '1586839389766', '{\"commentContent\":\"专注Java技术分享，促进Java开发领域的知识和创新的传播，解决编程之惑，为程序员服务。 \"}', '1586752131583');

-- ----------------------------
-- Table structure for wolf_reward
-- ----------------------------
DROP TABLE IF EXISTS `wolf_reward`;
CREATE TABLE `wolf_reward`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `senderId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '打赏人 id',
  `dataId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据实体 id',
  `type` int(11) NOT NULL COMMENT '0：帖子，1：回帖，2：用户',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '打赏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_role
-- ----------------------------
DROP TABLE IF EXISTS `wolf_role`;
CREATE TABLE `wolf_role`  (
  `oId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `roleName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `roleDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_role
-- ----------------------------
INSERT INTO `wolf_role` VALUES ('adminRole', 'Admin', '');
INSERT INTO `wolf_role` VALUES ('defaultRole', 'Default', '');
INSERT INTO `wolf_role` VALUES ('leaderRole', 'Leader', '');
INSERT INTO `wolf_role` VALUES ('memberRole', 'Member', '');
INSERT INTO `wolf_role` VALUES ('regularRole', 'Regular', '');
INSERT INTO `wolf_role` VALUES ('visitorRole', 'Visitor', '');

-- ----------------------------
-- Table structure for wolf_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `wolf_role_permission`;
CREATE TABLE `wolf_role_permission`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `roleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色 id',
  `permissionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限 id',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色 - 权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_role_permission
-- ----------------------------
INSERT INTO `wolf_role_permission` VALUES ('1586751529826', 'defaultRole', 'commonUpdateBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751529927', 'defaultRole', 'commonFollowArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751530031', 'defaultRole', 'commonAddComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751530133', 'defaultRole', 'commonRemoveBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751530234', 'defaultRole', 'commonUpdateArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751530334', 'defaultRole', 'commonWatchArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751530435', 'defaultRole', 'commonUpdateComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751530536', 'defaultRole', 'commonAddArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751530637', 'defaultRole', 'commonThankArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751530738', 'defaultRole', 'commonRemoveArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751530839', 'defaultRole', 'commonRemoveComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751530940', 'defaultRole', 'commonAddBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751531103', 'defaultRole', 'commonThankComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751531204', 'memberRole', 'commonUpdateBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751531306', 'memberRole', 'commonGoodComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751531442', 'memberRole', 'commonAtUser');
INSERT INTO `wolf_role_permission` VALUES ('1586751531543', 'memberRole', 'commonFollowArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751531644', 'memberRole', 'commonBadComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751531745', 'memberRole', 'commonGoodArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751531847', 'memberRole', 'commonUseIL');
INSERT INTO `wolf_role_permission` VALUES ('1586751531949', 'memberRole', 'commonBadArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751532085', 'memberRole', 'commonAddComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751532185', 'memberRole', 'commonRemoveBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751532286', 'memberRole', 'commonUpdateArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751532387', 'memberRole', 'commonWatchArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751532488', 'memberRole', 'commonUpdateComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751532589', 'memberRole', 'commonAddArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751532691', 'memberRole', 'commonThankArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751532793', 'memberRole', 'commonRemoveArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751532895', 'memberRole', 'commonRemoveComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751532999', 'memberRole', 'commonAddBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751533099', 'memberRole', 'commonThankComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751533200', 'regularRole', 'commonGoodComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751533302', 'regularRole', 'commonUseIL');
INSERT INTO `wolf_role_permission` VALUES ('1586751533404', 'regularRole', 'commonBadArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751533505', 'regularRole', 'commonAddComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751533609', 'regularRole', 'commonViewCommentHistory');
INSERT INTO `wolf_role_permission` VALUES ('1586751533709', 'regularRole', 'commonUpdateArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751533810', 'regularRole', 'commonWatchArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751533911', 'regularRole', 'commonAtParticipants');
INSERT INTO `wolf_role_permission` VALUES ('1586751534014', 'regularRole', 'tagUpdateTagBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751534116', 'regularRole', 'commonAddArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751534223', 'regularRole', 'commonExchangeIC');
INSERT INTO `wolf_role_permission` VALUES ('1586751534324', 'regularRole', 'commonThankArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751534424', 'regularRole', 'commonRemoveArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751534525', 'regularRole', 'commonRemoveComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751534625', 'regularRole', 'commonThankComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751534725', 'regularRole', 'menuAdminTags');
INSERT INTO `wolf_role_permission` VALUES ('1586751534825', 'regularRole', 'commonStickArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751534926', 'regularRole', 'commonViewArticleHistory');
INSERT INTO `wolf_role_permission` VALUES ('1586751535028', 'regularRole', 'commonUpdateBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751535131', 'regularRole', 'menuAdmin');
INSERT INTO `wolf_role_permission` VALUES ('1586751535232', 'regularRole', 'commonAtUser');
INSERT INTO `wolf_role_permission` VALUES ('1586751535332', 'regularRole', 'commonFollowArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751535432', 'regularRole', 'commonBadComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751535537', 'regularRole', 'commonGoodArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751535638', 'regularRole', 'commonAddArticleAnonymous');
INSERT INTO `wolf_role_permission` VALUES ('1586751535738', 'regularRole', 'commonRemoveBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751535844', 'regularRole', 'commonUpdateComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751535946', 'regularRole', 'commonAddCommentAnonymous');
INSERT INTO `wolf_role_permission` VALUES ('1586751536049', 'regularRole', 'commonAddBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751536149', 'leaderRole', 'menuAdminIcs');
INSERT INTO `wolf_role_permission` VALUES ('1586751536253', 'leaderRole', 'userExchangePoint');
INSERT INTO `wolf_role_permission` VALUES ('1586751536355', 'leaderRole', 'articleReindexArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751536457', 'leaderRole', 'icGenIC');
INSERT INTO `wolf_role_permission` VALUES ('1586751536560', 'leaderRole', 'commonUseIL');
INSERT INTO `wolf_role_permission` VALUES ('1586751536663', 'leaderRole', 'commonBadArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751536768', 'leaderRole', 'commonAddComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751536870', 'leaderRole', 'rwAddReservedWord');
INSERT INTO `wolf_role_permission` VALUES ('1586751536972', 'leaderRole', 'commonViewCommentHistory');
INSERT INTO `wolf_role_permission` VALUES ('1586751537074', 'leaderRole', 'commentUpdateCommentBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751537174', 'leaderRole', 'commonUpdateArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751537279', 'leaderRole', 'commonAddArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751537379', 'leaderRole', 'commonExchangeIC');
INSERT INTO `wolf_role_permission` VALUES ('1586751537479', 'leaderRole', 'commonThankArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751537585', 'leaderRole', 'commonRemoveArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751537684', 'leaderRole', 'commonRemoveComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751537785', 'leaderRole', 'icUpdateICBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751537886', 'leaderRole', 'menuAdminTags');
INSERT INTO `wolf_role_permission` VALUES ('1586751537986', 'leaderRole', 'commonAtUser');
INSERT INTO `wolf_role_permission` VALUES ('1586751538086', 'leaderRole', 'commonBadComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751538188', 'leaderRole', 'articleCancelStickArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751538290', 'leaderRole', 'commonRemoveBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751538393', 'leaderRole', 'rwRemoveReservedWord');
INSERT INTO `wolf_role_permission` VALUES ('1586751538495', 'leaderRole', 'articleStickArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751538618', 'leaderRole', 'commonUpdateComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751538719', 'leaderRole', 'commonAddCommentAnonymous');
INSERT INTO `wolf_role_permission` VALUES ('1586751538822', 'leaderRole', 'rwUpdateReservedWordBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751538924', 'leaderRole', 'menuAdminArticles');
INSERT INTO `wolf_role_permission` VALUES ('1586751539025', 'leaderRole', 'commonGoodComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751539127', 'leaderRole', 'menuAdminComments');
INSERT INTO `wolf_role_permission` VALUES ('1586751539227', 'leaderRole', 'userAddUser');
INSERT INTO `wolf_role_permission` VALUES ('1586751539327', 'leaderRole', 'commonWatchArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751539427', 'leaderRole', 'breezemoonRemoveBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751539527', 'leaderRole', 'commonAtParticipants');
INSERT INTO `wolf_role_permission` VALUES ('1586751539629', 'leaderRole', 'tagUpdateTagBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751539729', 'leaderRole', 'menuAdminRWs');
INSERT INTO `wolf_role_permission` VALUES ('1586751539831', 'leaderRole', 'commonThankComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751539936', 'leaderRole', 'commonStickArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751540036', 'leaderRole', 'commonViewArticleHistory');
INSERT INTO `wolf_role_permission` VALUES ('1586751540136', 'leaderRole', 'commonUpdateBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751540236', 'leaderRole', 'menuAdmin');
INSERT INTO `wolf_role_permission` VALUES ('1586751540336', 'leaderRole', 'userAddPoint');
INSERT INTO `wolf_role_permission` VALUES ('1586751540441', 'leaderRole', 'commonFollowArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751540544', 'leaderRole', 'commonGoodArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751540646', 'leaderRole', 'userUpdateUserBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751540751', 'leaderRole', 'articleUpdateArticleBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751540853', 'leaderRole', 'commonAddArticleAnonymous');
INSERT INTO `wolf_role_permission` VALUES ('1586751540953', 'leaderRole', 'userDeductPoint');
INSERT INTO `wolf_role_permission` VALUES ('1586751541071', 'leaderRole', 'userUpdateUserAdvanced');
INSERT INTO `wolf_role_permission` VALUES ('1586751541174', 'leaderRole', 'breezemoonUpdateBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751541274', 'leaderRole', 'commonAddBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751541375', 'leaderRole', 'menuAdminUsers');
INSERT INTO `wolf_role_permission` VALUES ('1586751541475', 'leaderRole', 'menuAdminBreezemoons');
INSERT INTO `wolf_role_permission` VALUES ('1586751541576', 'adminRole', 'menuAdminIcs');
INSERT INTO `wolf_role_permission` VALUES ('1586751541678', 'adminRole', 'userExchangePoint');
INSERT INTO `wolf_role_permission` VALUES ('1586751541779', 'adminRole', 'articleReindexArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751541879', 'adminRole', 'icGenIC');
INSERT INTO `wolf_role_permission` VALUES ('1586751541988', 'adminRole', 'commonUseIL');
INSERT INTO `wolf_role_permission` VALUES ('1586751542089', 'adminRole', 'commonBadArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751542189', 'adminRole', 'commonAddComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751542293', 'adminRole', 'rwAddReservedWord');
INSERT INTO `wolf_role_permission` VALUES ('1586751542394', 'adminRole', 'commonViewCommentHistory');
INSERT INTO `wolf_role_permission` VALUES ('1586751542495', 'adminRole', 'commentUpdateCommentBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751542597', 'adminRole', 'commonUpdateArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751542698', 'adminRole', 'domainAddDomain');
INSERT INTO `wolf_role_permission` VALUES ('1586751542798', 'adminRole', 'domainUpdateDomainBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751542899', 'adminRole', 'commonAddArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751542999', 'adminRole', 'commonExchangeIC');
INSERT INTO `wolf_role_permission` VALUES ('1586751543099', 'adminRole', 'commonThankArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751543199', 'adminRole', 'commonRemoveArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751543303', 'adminRole', 'commonRemoveComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751543404', 'adminRole', 'icUpdateICBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751543507', 'adminRole', 'menuAdminTags');
INSERT INTO `wolf_role_permission` VALUES ('1586751543609', 'adminRole', 'commonAtUser');
INSERT INTO `wolf_role_permission` VALUES ('1586751543711', 'adminRole', 'commonBadComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751543812', 'adminRole', 'articleCancelStickArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751543912', 'adminRole', 'menuAdminAD');
INSERT INTO `wolf_role_permission` VALUES ('1586751544012', 'adminRole', 'miscAllowAddComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751544112', 'adminRole', 'commonRemoveBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751544212', 'adminRole', 'rwRemoveReservedWord');
INSERT INTO `wolf_role_permission` VALUES ('1586751544314', 'adminRole', 'articleStickArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751544415', 'adminRole', 'commonUpdateComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751544517', 'adminRole', 'commonAddCommentAnonymous');
INSERT INTO `wolf_role_permission` VALUES ('1586751544619', 'adminRole', 'miscAllowAnonymousView');
INSERT INTO `wolf_role_permission` VALUES ('1586751544738', 'adminRole', 'menuAdminReports');
INSERT INTO `wolf_role_permission` VALUES ('1586751544838', 'adminRole', 'rwUpdateReservedWordBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751544940', 'adminRole', 'menuAdminArticles');
INSERT INTO `wolf_role_permission` VALUES ('1586751545042', 'adminRole', 'commonGoodComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751545143', 'adminRole', 'domainRemoveDomainTag');
INSERT INTO `wolf_role_permission` VALUES ('1586751545245', 'adminRole', 'menuAdminComments');
INSERT INTO `wolf_role_permission` VALUES ('1586751545345', 'adminRole', 'miscRegisterMethod');
INSERT INTO `wolf_role_permission` VALUES ('1586751545446', 'adminRole', 'userAddUser');
INSERT INTO `wolf_role_permission` VALUES ('1586751545546', 'adminRole', 'menuAdminMisc');
INSERT INTO `wolf_role_permission` VALUES ('1586751545650', 'adminRole', 'articleRemoveArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751545750', 'adminRole', 'commonWatchArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751545850', 'adminRole', 'breezemoonRemoveBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751545950', 'adminRole', 'commonAtParticipants');
INSERT INTO `wolf_role_permission` VALUES ('1586751546051', 'adminRole', 'tagUpdateTagBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751546151', 'adminRole', 'miscAllowAddArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751546253', 'adminRole', 'menuAdminRWs');
INSERT INTO `wolf_role_permission` VALUES ('1586751546353', 'adminRole', 'commonThankComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751546453', 'adminRole', 'commentRemoveComment');
INSERT INTO `wolf_role_permission` VALUES ('1586751546562', 'adminRole', 'commonStickArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751546666', 'adminRole', 'articleAddArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751546766', 'adminRole', 'commonViewArticleHistory');
INSERT INTO `wolf_role_permission` VALUES ('1586751546866', 'adminRole', 'commonUpdateBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751546969', 'adminRole', 'menuAdmin');
INSERT INTO `wolf_role_permission` VALUES ('1586751547069', 'adminRole', 'userAddPoint');
INSERT INTO `wolf_role_permission` VALUES ('1586751547177', 'adminRole', 'commonFollowArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751547281', 'adminRole', 'commonGoodArticle');
INSERT INTO `wolf_role_permission` VALUES ('1586751547382', 'adminRole', 'userUpdateUserBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751547483', 'adminRole', 'articleUpdateArticleBasic');
INSERT INTO `wolf_role_permission` VALUES ('1586751547584', 'adminRole', 'domainAddDomainTag');
INSERT INTO `wolf_role_permission` VALUES ('1586751547703', 'adminRole', 'commonAddArticleAnonymous');
INSERT INTO `wolf_role_permission` VALUES ('1586751547807', 'adminRole', 'userDeductPoint');
INSERT INTO `wolf_role_permission` VALUES ('1586751547910', 'adminRole', 'adUpdateADSide');
INSERT INTO `wolf_role_permission` VALUES ('1586751548012', 'adminRole', 'userUpdateUserAdvanced');
INSERT INTO `wolf_role_permission` VALUES ('1586751548120', 'adminRole', 'adUpdateBanner');
INSERT INTO `wolf_role_permission` VALUES ('1586751548226', 'adminRole', 'breezemoonUpdateBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751548328', 'adminRole', 'miscLanguage');
INSERT INTO `wolf_role_permission` VALUES ('1586751548436', 'adminRole', 'menuAdminRoles');
INSERT INTO `wolf_role_permission` VALUES ('1586751548537', 'adminRole', 'commonAddBreezemoon');
INSERT INTO `wolf_role_permission` VALUES ('1586751548648', 'adminRole', 'menuAdminUsers');
INSERT INTO `wolf_role_permission` VALUES ('1586751548751', 'adminRole', 'articleReindexArticles');
INSERT INTO `wolf_role_permission` VALUES ('1586751548865', 'adminRole', 'menuAdminDomains');
INSERT INTO `wolf_role_permission` VALUES ('1586751548992', 'adminRole', 'menuAdminBreezemoons');
INSERT INTO `wolf_role_permission` VALUES ('1586751549095', 'adminRole', 'domainRemoveDomain');

-- ----------------------------
-- Table structure for wolf_tag
-- ----------------------------
DROP TABLE IF EXISTS `wolf_tag`;
CREATE TABLE `wolf_tag`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `tagReferenceCount` int(11) NOT NULL COMMENT '标签引用（帖子/用户自评等）计数',
  `tagCommentCount` int(11) NOT NULL COMMENT '标签回帖计数',
  `tagFollowerCount` int(11) NOT NULL COMMENT '标签关注者计数',
  `tagLinkCount` int(11) NOT NULL COMMENT '标签链接引用计数',
  `tagTitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签标题',
  `tagURI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签访问路径',
  `tagDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签描述',
  `tagIconPath` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签图标路径',
  `tagCSS` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签 CSS',
  `tagStatus` int(11) NOT NULL COMMENT '0：正常，1：封禁',
  `tagGoodCnt` int(11) NOT NULL COMMENT '标签点赞计数',
  `tagBadCnt` int(11) NOT NULL COMMENT '标签点踩计数',
  `tagSeoTitle` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签 SEO 标题',
  `tagSeoKeywords` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签 SEO 关键字',
  `tagSeoDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签 SEO 描述',
  `tagRandomDouble` double NOT NULL COMMENT '标签随机数，用于快速选择随机标签',
  `tagAd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签广告',
  `tagShowSideAd` int(11) NOT NULL COMMENT '是否显示全站侧边栏广告',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_tag
-- ----------------------------
INSERT INTO `wolf_tag` VALUES ('1586751555517', 1, 0, 0, 0, '系统公告', 'announcement', '', '', '', 0, 0, 0, '系统公告', '系统公告', '', 0.6266119599685548, '', 0);
INSERT INTO `wolf_tag` VALUES ('1586751557598', 0, 0, 1, 0, 'wolf', 'Java论坛', 'Java论坛 :Java开发者的网上家园', 'http://127.0.0.1/images/tags/wolf.png', '', 0, 0, 0, 'wolf', 'wolf', '', 0.7625186689880592, '', 0);
INSERT INTO `wolf_tag` VALUES ('1586759250444', 1, 2, 0, 0, 'java', 'java', '', '', '', 0, 0, 0, 'java', 'java', '', 0.6830443578015094, '', 0);
INSERT INTO `wolf_tag` VALUES ('1586759670747', 1, 0, 0, 0, 'HashMap', 'hashmap', '', '', '', 0, 0, 0, 'HashMap', 'HashMap', '', 0.3479269344532411, '', 0);
INSERT INTO `wolf_tag` VALUES ('1586759671179', 1, 0, 0, 0, 'jdk8', 'jdk8', '', '', '', 0, 0, 0, 'jdk8', 'jdk8', '', 0.24740578791257295, '', 0);
INSERT INTO `wolf_tag` VALUES ('1586839357060', 1, 1, 0, 0, '待分类', '%e5%be%85%e5%88%86%e7%b1%bb', '', '', '', 0, 0, 0, '待分类', '待分类', '', 0.2900193637038183, '', 0);
INSERT INTO `wolf_tag` VALUES ('1586839357232', 1, 1, 0, 0, 'Q&A', 'q%26a', '', '', '', 0, 0, 0, 'Q&A', 'Q&A', '', 0.6870141156051565, '', 0);

-- ----------------------------
-- Table structure for wolf_tag_article
-- ----------------------------
DROP TABLE IF EXISTS `wolf_tag_article`;
CREATE TABLE `wolf_tag_article`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `article_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子 id',
  `tag_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签 id',
  `articleCommentCount` int(11) NOT NULL COMMENT '帖子回帖计数',
  `articleLatestCmtTime` bigint(20) NOT NULL COMMENT '帖子最近一次回帖时间',
  `redditScore` double NOT NULL COMMENT '帖子 Reddit 算法评分',
  `articlePerfect` int(11) NOT NULL COMMENT '0：帖子不是优选，1：帖子是优选',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签 - 帖子关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_tag_article
-- ----------------------------
INSERT INTO `wolf_tag_article` VALUES ('1586751560252', '1586751559998', '1586751555517', 0, 1586751559998, 0, 0);
INSERT INTO `wolf_tag_article` VALUES ('1586759250693', '1586759249983', '1586759250444', 2, 1586765347335, 0, 0);
INSERT INTO `wolf_tag_article` VALUES ('1586759670937', '1586759670650', '1586759670747', 0, 1586759670650, 0, 0);
INSERT INTO `wolf_tag_article` VALUES ('1586759671365', '1586759670650', '1586759671179', 0, 1586759670650, 0, 0);
INSERT INTO `wolf_tag_article` VALUES ('1586839357119', '1586839356989', '1586839357060', 1, 1586839389763, 0, 0);
INSERT INTO `wolf_tag_article` VALUES ('1586839357292', '1586839356989', '1586839357232', 1, 1586839389763, 0, 0);

-- ----------------------------
-- Table structure for wolf_tag_tag
-- ----------------------------
DROP TABLE IF EXISTS `wolf_tag_tag`;
CREATE TABLE `wolf_tag_tag`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `tag1_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签1 id',
  `tag2_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签2 id',
  `weight` int(11) NOT NULL COMMENT '关联权重',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签 - 标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_tag_tag
-- ----------------------------
INSERT INTO `wolf_tag_tag` VALUES ('1586759672541', '1586759670747', '1586759671179', 1);
INSERT INTO `wolf_tag_tag` VALUES ('1586839357635', '1586839357060', '1586839357232', 1);

-- ----------------------------
-- Table structure for wolf_user
-- ----------------------------
DROP TABLE IF EXISTS `wolf_user`;
CREATE TABLE `wolf_user`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `userNo` int(11) NOT NULL COMMENT '用户编号',
  `userEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱',
  `userName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `userPassword` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码（MD5）',
  `userNickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `userTags` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户自评标签',
  `userURL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户链接',
  `userQQ` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户 QQ',
  `userIntro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户简介',
  `userAvatarType` int(11) NOT NULL COMMENT '0：Gravatar，1：外链',
  `userAvatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像图片 URL',
  `userOnlineFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户是否在线',
  `userRole` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户角色',
  `userArticleCount` int(11) NOT NULL COMMENT '发帖计数',
  `userCommentCount` int(11) NOT NULL COMMENT '回帖计数',
  `userTagCount` int(11) NOT NULL COMMENT '用户标签计数',
  `userStatus` int(11) NOT NULL COMMENT '0：正常，1：封禁',
  `userPoint` int(11) NOT NULL COMMENT '积分余额',
  `userUsedPoint` int(11) NOT NULL COMMENT '累计消费积分',
  `userJoinPointRank` int(11) NOT NULL COMMENT '0：参与积分余额排行榜，1：不参与积分余额排行榜',
  `userJoinUsedPointRank` int(11) NOT NULL COMMENT '0：参与积分消费排行榜，1：不参与积分消费排行榜',
  `userLatestArticleTime` bigint(20) NOT NULL COMMENT '最近一次发帖时间',
  `userLatestCmtTime` bigint(20) NOT NULL COMMENT '最近一次回帖时间',
  `userLatestLoginTime` bigint(20) NOT NULL COMMENT '最近一次登录时间',
  `userLatestLoginIP` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '最近一次登录 IP',
  `userAppRole` int(11) NOT NULL COMMENT '0：应用角色 - 黑客，1：应用角色 - 画家',
  `userCheckinTime` bigint(20) NOT NULL COMMENT '最近一次签到时间',
  `userLongestCheckinStreakStart` int(11) NOT NULL COMMENT '最长连续签到开始日期',
  `userLongestCheckinStreakEnd` int(11) NOT NULL COMMENT '最长连续签到结束日期',
  `userCurrentCheckinStreakStart` int(11) NOT NULL COMMENT '当前连续签到开始日期',
  `userCurrentCheckinStreakEnd` int(11) NOT NULL COMMENT '当前连续签到结束日期',
  `userLongestCheckinStreak` int(11) NOT NULL COMMENT '最长连续签到天数',
  `userCurrentCheckinStreak` int(11) NOT NULL COMMENT '当前连续签到天数',
  `userSkin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户皮肤',
  `userMobileSkin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户移动端皮肤',
  `userCountry` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户所在国家',
  `userProvince` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户所在省份',
  `userCity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户所在城市',
  `userUpdateTime` bigint(20) NOT NULL COMMENT '用户更新时间',
  `userGeoStatus` int(11) NOT NULL COMMENT '0：公开地理位置，1：不公开地理位置',
  `userCommentViewMode` int(11) NOT NULL COMMENT '0：传统回帖浏览模式（按时间升序），1：实时回帖浏览模式（按时间降序）',
  `userUAStatus` int(11) NOT NULL COMMENT '0：公开 User-Agent，1：不公开 User-Agent',
  `userNotifyStatus` int(11) NOT NULL COMMENT '0：启用 Web 通知，1：禁用 Web 通知',
  `userPointStatus` int(11) NOT NULL COMMENT '0：公开积分列表，1：不公开积分列表',
  `userBreezemoonStatus` int(11) NOT NULL COMMENT '0：公开清风明月列表，1：不公开清风明月列表',
  `userFollowerStatus` int(11) NOT NULL COMMENT '0：公开关注者列表，1：不公开关注者列表',
  `userFollowingArticleStatus` int(11) NOT NULL COMMENT '0：公开收藏帖子列表，1：不公开收藏帖子列表',
  `userWatchingArticleStatus` int(11) NOT NULL COMMENT '0：公开关注帖子列表，1：不公开关注帖子列表',
  `userFollowingTagStatus` int(11) NOT NULL COMMENT '0：公开关注标签列表，1：不公开关注标签列表',
  `userFollowingUserStatus` int(11) NOT NULL COMMENT '0：公开关注用户列表，1：不公开关注用户列表',
  `userCommentStatus` int(11) NOT NULL COMMENT '0：公开回帖列表，1：不公开回帖列表',
  `userArticleStatus` int(11) NOT NULL COMMENT '0：公开帖子列表，1：不公开帖子列表',
  `userOnlineStatus` int(11) NOT NULL COMMENT '0：公开在线状态，1：不公开在线状态',
  `userListPageSize` int(11) NOT NULL COMMENT '帖子列表每页显示条数',
  `userListViewMode` int(11) NOT NULL COMMENT '0：仅标题，1：标题+摘要',
  `userAvatarViewMode` int(11) NOT NULL COMMENT '0：原始头像图片，比如 gif 动图，1：静态头像图片',
  `userSubMailStatus` int(11) NOT NULL COMMENT '0：启用邮件订阅，1：禁用邮件订阅',
  `userSubMailSendTime` bigint(20) NOT NULL COMMENT '用户订阅邮件最近推送时间',
  `userKeyboardShortcutsStatus` int(11) NOT NULL COMMENT '0：启用键盘快捷键，1：禁用键盘快捷键',
  `userReplyWatchArticleStatus` int(11) NOT NULL COMMENT '0：回帖后自动关注帖子，1：回帖后不自动关注帖子',
  `userLanguage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户所选语言',
  `userTimezone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户所在时区',
  `userGuideStep` int(11) NOT NULL COMMENT '新注册后向导到达第几步',
  `userForwardPageStatus` int(11) NOT NULL COMMENT '0：使用重定向页面，1：禁用重定向页面',
  `userIndexRedirectURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义首页跳转 https://github.com/b3log/symphony/issues/774',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_user
-- ----------------------------
INSERT INTO `wolf_user` VALUES ('1586751549756', 1, 'admin@sym.b3log.org', 'wolf', 'bf4397d8b4dc061e1b6d191a352e9134', '', '', '', '', '', 2, 'http://127.0.0.1/images/user-thumbnail.png', '1', 'adminRole', 2, 2, 4, 0, 449, 51, 0, 0, 1586759670368, 1586765347335, 1586763440201, '127.0.0.1', 0, 0, 0, 0, 0, 0, 0, 0, 'classic', 'mobile', '', '', '', 1586763440201, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 1586751549694, 1, 1, 'zh_CN', 'Asia/Shanghai', 0, 0, '');
INSERT INTO `wolf_user` VALUES ('1586751551849', 2, 'combot@sym.b3log.org', 'ComBot', '226932bd689e06a38a1c9158797a0bbb', '', '', '', '', '', 2, 'http://127.0.0.1/upload/2020/04/f2c2700cd0304abe9a7b3fbee47d66ab.jpg', '0', 'defaultRole', 0, 0, 0, 0, 500, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'classic', 'mobile', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 1586751551849, 1, 1, 'zh_CN', 'Asia/Shanghai', 0, 0, '');
INSERT INTO `wolf_user` VALUES ('1586752131583', 3, '3198371410@qq.com', 'BlackBox', '6cc1ed8aa4f63e5758ca5ede29408401', '', '', '', '', '', 2, 'http://localhost/upload/2020/04/ba79a75b2f389dae444a2993f72093b-810b077d.jpg', '1', 'defaultRole', 2, 1, 3, 0, 468, 42, 0, 0, 1586839356982, 1586839389763, 1586840256776, '47.75.193.76', 0, 0, 0, 0, 0, 0, 0, 0, 'classic', 'mobile', '', '', '', 1586840256776, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 1586752600635, 1, 1, 'zh_CN', 'Asia/Shanghai', 0, 0, '');

-- ----------------------------
-- Table structure for wolf_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `wolf_user_tag`;
CREATE TABLE `wolf_user_tag`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户 id',
  `tag_oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签 id',
  `type` int(11) NOT NULL COMMENT '0：创建者，1：帖子使用，2：用户自评标签',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户 - 标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wolf_user_tag
-- ----------------------------
INSERT INTO `wolf_user_tag` VALUES ('1586751555912', '1586751549756', '1586751555517', 0);
INSERT INTO `wolf_user_tag` VALUES ('1586751557886', '1586751549756', '1586751557598', 0);
INSERT INTO `wolf_user_tag` VALUES ('1586751560398', '1586751549756', '1586751555517', 1);
INSERT INTO `wolf_user_tag` VALUES ('1586759250796', '1586752131583', '1586759250444', 0);
INSERT INTO `wolf_user_tag` VALUES ('1586759671037', '1586751549756', '1586759670747', 0);
INSERT INTO `wolf_user_tag` VALUES ('1586759671460', '1586751549756', '1586759671179', 0);
INSERT INTO `wolf_user_tag` VALUES ('1586839357179', '1586752131583', '1586839357060', 0);
INSERT INTO `wolf_user_tag` VALUES ('1586839357343', '1586752131583', '1586839357232', 0);

-- ----------------------------
-- Table structure for wolf_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `wolf_verifycode`;
CREATE TABLE `wolf_verifycode`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `userId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收用户 id',
  `type` int(11) NOT NULL COMMENT '0：邮件',
  `bizType` int(11) NOT NULL COMMENT '0：注册，1：重置密码',
  `receiver` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收者',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `status` int(11) NOT NULL COMMENT '0：未发送，1：已发送',
  `expired` bigint(20) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_visit
-- ----------------------------
DROP TABLE IF EXISTS `wolf_visit`;
CREATE TABLE `wolf_visit`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `visitURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '浏览链接',
  `visitIP` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IP',
  `visitUA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'User-Agent',
  `visitCity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市',
  `visitDeviceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备唯一标识',
  `visitUserId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '浏览者 id',
  `visitRefererURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上游链接',
  `visitCreated` bigint(20) NOT NULL COMMENT '统计时间',
  `visitExpired` bigint(20) NOT NULL COMMENT '统计过期时间',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '浏览表 https://github.com/b3log/symphony/issues/687' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wolf_vote
-- ----------------------------
DROP TABLE IF EXISTS `wolf_vote`;
CREATE TABLE `wolf_vote`  (
  `oId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `userId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '投票者 id',
  `type` int(11) NOT NULL COMMENT '0：赞成，1：反对',
  `dataType` int(11) NOT NULL COMMENT '0：帖子，1：回帖，2：用户，3：标签',
  `dataId` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据实体 id',
  PRIMARY KEY (`oId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投票表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
