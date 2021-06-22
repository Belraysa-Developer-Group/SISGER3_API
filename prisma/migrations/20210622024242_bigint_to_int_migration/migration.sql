-- CreateTable
CREATE TABLE `agency` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ajuste` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `entrada` INTEGER,
    `banking` INTEGER,
    `fecha` DATETIME(0) NOT NULL,
    `importe` DOUBLE NOT NULL,
    `concepto` VARCHAR(255) NOT NULL,
    `sisgerCode` VARCHAR(255),

    UNIQUE INDEX `ajuste.entrada_unique`(`entrada`),
    INDEX `IDX_DA99B804E766A51E`(`banking`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `anexo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `price` DOUBLE,
    `cost` DOUBLE,
    `abonos` DOUBLE,
    `uNeta` DOUBLE,
    `uBruta` DOUBLE,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `anno` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `arancel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `capitulo` INTEGER,
    `um` INTEGER,
    `articulos` LONGTEXT NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `arancel` DOUBLE NOT NULL,
    `observaciones` LONGTEXT NOT NULL,

    INDEX `IDX_504E145C209282A9`(`um`),
    INDEX `IDX_504E145C2BA5E28F`(`capitulo`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bank` (
    `id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `banking` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `enabled` BOOLEAN NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `balance` DOUBLE NOT NULL,
    `initBalance` DOUBLE NOT NULL,
    `discr` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bankingentry` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `banking` INTEGER,
    `recibo` INTEGER,
    `date` DATETIME(0) NOT NULL,
    `details` LONGTEXT NOT NULL,
    `credit` DOUBLE NOT NULL,
    `debit` DOUBLE NOT NULL,
    `balance` DOUBLE NOT NULL,
    `activo` BOOLEAN,

    UNIQUE INDEX `bankingentry.recibo_unique`(`recibo`),
    INDEX `IDX_AD17BE1E766A51E`(`banking`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bulto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `concepto` INTEGER,
    `sisgerCode` VARCHAR(255),
    `indice` INTEGER NOT NULL,

    INDEX `IDX_6F635EE5648388D0`(`concepto`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `capitulo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `numero` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `card` (
    `id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cash` (
    `id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user` INTEGER,
    `firstName` VARCHAR(255) NOT NULL,
    `lastName` VARCHAR(255) NOT NULL,
    `phones` VARCHAR(255),
    `email` VARCHAR(255),
    `createdAt` DATETIME(0),
    `dni` VARCHAR(255),
    `passport` VARCHAR(255),
    `address` VARCHAR(255),
    `municipality` VARCHAR(255),
    `province` VARCHAR(255),
    `country` VARCHAR(255),
    `cell` VARCHAR(255),

    INDEX `IDX_C0E801638D93D649`(`user`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `concepto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `remitente` INTEGER,
    `consignado` INTEGER,
    `fechaCreacion` DATETIME(0) NOT NULL,
    `tipo` VARCHAR(255) NOT NULL,
    `sisgerCode` VARCHAR(255),
    `discr` VARCHAR(255) NOT NULL,
    `contenedor` INTEGER,
    `estado` VARCHAR(255) NOT NULL,
    `fechaHBL` DATETIME(0),
    `expediente` INTEGER,

    INDEX `IDX_9DF5EA8651A5ACA4`(`remitente`),
    INDEX `IDX_9DF5EA868F8E7CD`(`consignado`),
    INDEX `IDX_9DF5EA86E6B58BB1`(`contenedor`),
    INDEX `expediente`(`expediente`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `conceptocosto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workspace` INTEGER,
    `name` VARCHAR(255) NOT NULL,

    INDEX `IDX_8A5985E18D940019`(`workspace`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `conceptogasto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workspace` INTEGER,
    `name` VARCHAR(255) NOT NULL,

    INDEX `IDX_9F0654128D940019`(`workspace`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contenedor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo` INTEGER,
    `mes` INTEGER,
    `codigo` LONGTEXT,
    `sello` LONGTEXT,
    `estado` LONGTEXT NOT NULL,
    `volumenM3` DOUBLE NOT NULL,
    `maxPesoKg` DOUBLE NOT NULL,
    `motonave` LONGTEXT,
    `mbl` LONGTEXT,
    `puertoSalida` LONGTEXT,
    `puertoEntrada` LONGTEXT,
    `fechaEntrada` DATETIME(0),
    `fechaSalida` DATETIME(0),
    `indice` INTEGER NOT NULL,
    `indiceAnual` INTEGER NOT NULL,

    INDEX `IDX_A9E888616EC83E05`(`mes`),
    INDEX `IDX_A9E88861702D1D47`(`tipo`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `anno` INTEGER,
    `nombre` VARCHAR(255) NOT NULL,
    `numero` INTEGER NOT NULL,

    INDEX `IDX_568578E5C6E493B0`(`anno`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `costo` (
    `id` INTEGER NOT NULL,
    `pagueA` VARCHAR(255) NOT NULL,
    `detalles` MEDIUMTEXT NOT NULL,
    `idEgreso` INTEGER,

    UNIQUE INDEX `costo.idEgreso_unique`(`idEgreso`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `costo_conceptocosto` (
    `costo_id` INTEGER NOT NULL,
    `conceptocosto_id` INTEGER NOT NULL,

    INDEX `IDX_AFA48D2C3D19862A`(`costo_id`),
    INDEX `IDX_AFA48D2C746BE358`(`conceptocosto_id`),
    PRIMARY KEY (`costo_id`, `conceptocosto_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `costorecurrente` (
    `id` INTEGER NOT NULL,
    `pagueA` VARCHAR(255) NOT NULL,
    `detalles` MEDIUMTEXT NOT NULL,
    `idEgreso` INTEGER,

    UNIQUE INDEX `costorecurrente.idEgreso_unique`(`idEgreso`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `costorecurrente_inventario` (
    `costorecurrente_id` INTEGER NOT NULL,
    `inventario_id` INTEGER NOT NULL,

    INDEX `IDX_C3CE2E6F8E037CA7`(`costorecurrente_id`),
    INDEX `IDX_C3CE2E6FDFDFBE2A`(`inventario_id`),
    PRIMARY KEY (`costorecurrente_id`, `inventario_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` INTEGER,
    `client` INTEGER,
    `url` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,

    INDEX `IDX_211FE8208CDE5729`(`type`),
    INDEX `IDX_211FE820C7440455`(`client`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documenttype` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ena` (
    `id` INTEGER NOT NULL,
    `fechaEntrada` DATETIME(0) NOT NULL,
    `fechaSalida` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `envio` (
    `id` INTEGER NOT NULL,
    `remitenteNombre` VARCHAR(255) NOT NULL,
    `remitenteCedula` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `extra` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario` INTEGER,
    `entrada` INTEGER,
    `banking` INTEGER,
    `fecha` DATETIME(0) NOT NULL,
    `importe` DOUBLE NOT NULL,
    `concepto` VARCHAR(255) NOT NULL,
    `sisgerCode` VARCHAR(255),

    UNIQUE INDEX `extra.entrada_unique`(`entrada`),
    INDEX `IDX_8CFE22612265B05D`(`usuario`),
    INDEX `IDX_8CFE2261E766A51E`(`banking`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gasto` (
    `id` INTEGER NOT NULL,
    `detalles` MEDIUMTEXT NOT NULL,
    `pagueA` VARCHAR(255) NOT NULL,
    `idEgreso` INTEGER,

    UNIQUE INDEX `gasto.idEgreso_unique`(`idEgreso`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gasto_conceptogasto` (
    `gasto_id` INTEGER NOT NULL,
    `conceptogasto_id` INTEGER NOT NULL,

    INDEX `IDX_4ABE43B4A01E96FF`(`conceptogasto_id`),
    INDEX `IDX_4ABE43B4E96CF38D`(`gasto_id`),
    PRIMARY KEY (`gasto_id`, `conceptogasto_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `idegreso` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `idingreso` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ingreso` (
    `id` INTEGER NOT NULL,
    `cliente` INTEGER,
    `recibiDe` VARCHAR(255) NOT NULL,
    `detalles` MEDIUMTEXT,
    `saldoAnterior` DOUBLE,
    `abono` DOUBLE,
    `saldoPendiente` DOUBLE,
    `idIngreso` INTEGER,
    `cuentaXCobrar` BOOLEAN NOT NULL,
    `fechaLimite` DATETIME(0),

    UNIQUE INDEX `ingreso.idIngreso_unique`(`idIngreso`),
    INDEX `IDX_3261D83F41C9B25`(`cliente`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ingreso_service` (
    `ingreso_id` INTEGER NOT NULL,
    `service_id` INTEGER NOT NULL,

    INDEX `IDX_50F8A6FDE70E8ADB`(`ingreso_id`),
    INDEX `IDX_50F8A6FDED5CA9E6`(`service_id`),
    PRIMARY KEY (`ingreso_id`, `service_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ingresos_relacionados` (
    `ingreso_id` INTEGER NOT NULL,
    `costo_id` INTEGER NOT NULL,

    INDEX `IDX_8DA616F03D19862A`(`costo_id`),
    INDEX `IDX_8DA616F0E70E8ADB`(`ingreso_id`),
    PRIMARY KEY (`ingreso_id`, `costo_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `inventario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workspace` INTEGER,
    `nombre` VARCHAR(255) NOT NULL,

    INDEX `IDX_25444D258D940019`(`workspace`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `menaje` (
    `id` INTEGER NOT NULL,
    `fechaAutorizacion` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mercancia` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bulto` INTEGER,
    `fechaCreacion` DATETIME(0) NOT NULL,
    `descripcion` LONGTEXT NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `volumenM3` DOUBLE NOT NULL,
    `pesoKg` DOUBLE NOT NULL,
    `pesoLb` DOUBLE NOT NULL,
    `relacion` DOUBLE NOT NULL,
    `arancel` INTEGER,
    `tarifa` INTEGER,
    `alturaCm` DOUBLE NOT NULL,
    `anchoCm` DOUBLE NOT NULL,
    `profundidadCm` DOUBLE NOT NULL,
    `tarifaAlternativa` DOUBLE,
    `miRelacionada` INTEGER,

    INDEX `IDX_1FF8C8436555E543`(`miRelacionada`),
    INDEX `IDX_1FF8C8439FF32DC0`(`arancel`),
    INDEX `IDX_1FF8C843A01B5DE`(`tarifa`),
    INDEX `IDX_1FF8C843AEA271E1`(`bulto`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `metodopago_banking` (
    `banking_id` INTEGER NOT NULL,
    `paymentmethod_id` INTEGER NOT NULL,

    INDEX `IDX_A6DE07B7758C76C`(`banking_id`),
    INDEX `IDX_A6DE07B7778E3E6F`(`paymentmethod_id`),
    PRIMARY KEY (`banking_id`, `paymentmethod_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `nomenclador` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workspace` INTEGER,
    `nombre` VARCHAR(255) NOT NULL,

    INDEX `IDX_637350368D940019`(`workspace`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `paymentmethod` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `phone` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client` INTEGER,
    `number` INTEGER NOT NULL,

    INDEX `IDX_858EB8D9C7440455`(`client`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `precioventa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `expediente` INTEGER,
    `cliente` INTEGER,
    `precio` DOUBLE,
    `expedienteLider` INTEGER,

    INDEX `IDX_C69DD82B195F051C`(`expedienteLider`),
    INDEX `IDX_C69DD82BD59CA413`(`expediente`),
    INDEX `IDX_C69DD82BF41C9B25`(`cliente`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `receipe` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reply` INTEGER,
    `creationDate` DATETIME(0) NOT NULL,
    `importe` DOUBLE NOT NULL,
    `recibide` VARCHAR(255) NOT NULL,
    `suma` VARCHAR(255) NOT NULL,
    `concepto` VARCHAR(255) NOT NULL,
    `sisgerCode` VARCHAR(255),
    `paymentMethod` INTEGER,
    `refExpediente` VARCHAR(255),
    `activo` BOOLEAN,
    `entry` INTEGER,
    `workspace` INTEGER,
    `type` VARCHAR(255),

    UNIQUE INDEX `receipe.entry_unique`(`entry`),
    INDEX `IDX_F694AF2B8484E578`(`paymentMethod`),
    INDEX `IDX_F694AF2B8D940019`(`workspace`),
    INDEX `IDX_F694AF2BFDA8C6E0`(`reply`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `recibo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario` INTEGER,
    `workspace` INTEGER,
    `expediente` INTEGER,
    `fecha` DATETIME(0) NOT NULL,
    `importe` DOUBLE NOT NULL,
    `suma` VARCHAR(255),
    `sisgerCode` VARCHAR(255),
    `activo` BOOLEAN,
    `tipo` VARCHAR(255),
    `refExpediente` VARCHAR(255),
    `metodoPago` INTEGER,
    `discr` VARCHAR(255) NOT NULL,
    `motivoCancelacion` LONGTEXT,
    `creacion` DATETIME(0) NOT NULL,
    `firmado` BOOLEAN,

    INDEX `IDX_45052DCC2265B05D`(`usuario`),
    INDEX `IDX_45052DCC792D02F7`(`metodoPago`),
    INDEX `IDX_45052DCC8D940019`(`workspace`),
    INDEX `IDX_45052DCCD59CA413`(`expediente`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reply` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user` INTEGER,
    `beginDate` DATETIME(0) NOT NULL,
    `finishDate` DATETIME(0) NOT NULL,
    `pax` INTEGER NOT NULL,
    `observations` VARCHAR(255),
    `price` INTEGER,
    `sisgerCode` VARCHAR(255),
    `leader` INTEGER,
    `createdAt` DATETIME(0) NOT NULL,
    `month` INTEGER NOT NULL,
    `year` INTEGER NOT NULL,
    `workspace` INTEGER,

    INDEX `IDX_3C69E9E48D93D649`(`user`),
    INDEX `IDX_3C69E9E48D940019`(`workspace`),
    INDEX `IDX_3C69E9E4F5E3EAD7`(`leader`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reply_agency` (
    `reply_id` INTEGER NOT NULL,
    `agency_id` INTEGER NOT NULL,

    INDEX `IDX_79B960F68A0E4E7F`(`reply_id`),
    INDEX `IDX_79B960F6CDEADB2A`(`agency_id`),
    PRIMARY KEY (`reply_id`, `agency_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reply_client` (
    `reply_id` INTEGER NOT NULL,
    `client_id` INTEGER NOT NULL,

    INDEX `IDX_CE3DA24519EB6921`(`client_id`),
    INDEX `IDX_CE3DA2458A0E4E7F`(`reply_id`),
    PRIMARY KEY (`reply_id`, `client_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reply_service` (
    `reply_id` INTEGER NOT NULL,
    `service_id` INTEGER NOT NULL,

    INDEX `IDX_FC23F3108A0E4E7F`(`reply_id`),
    INDEX `IDX_FC23F310ED5CA9E6`(`service_id`),
    PRIMARY KEY (`reply_id`, `service_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `role` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `alias` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `workspace` INTEGER,

    INDEX `IDX_2E20A34E8D940019`(`workspace`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tarifa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `numero` INTEGER NOT NULL,
    `articulo` LONGTEXT NOT NULL,
    `precio` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipocontenedor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` LONGTEXT NOT NULL,
    `volumenM3` DOUBLE NOT NULL,
    `pesoKg` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `traspaso` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user` INTEGER,
    `origen` INTEGER,
    `destino` INTEGER,
    `creationDate` DATETIME(0) NOT NULL,
    `importe` DOUBLE NOT NULL,
    `suma` VARCHAR(255) NOT NULL,
    `concepto` VARCHAR(255) NOT NULL,
    `sisgerCode` VARCHAR(255),
    `entryOrigen` INTEGER,
    `entryDestino` INTEGER,

    UNIQUE INDEX `traspaso.entryOrigen_unique`(`entryOrigen`),
    UNIQUE INDEX `traspaso.entryDestino_unique`(`entryDestino`),
    INDEX `IDX_4956F2C072441912`(`origen`),
    INDEX `IDX_4956F2C081F64EFA`(`destino`),
    INDEX `IDX_4956F2C08D93D649`(`user`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `um` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` INTEGER,
    `username` VARCHAR(255) NOT NULL,
    `firstName` VARCHAR(255) NOT NULL,
    `lastName` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255),
    `salt` VARCHAR(255),
    `email` VARCHAR(255),
    `phone` VARCHAR(255),
    `photo` VARCHAR(255) NOT NULL,
    `letra` VARCHAR(255) NOT NULL,
    `workspace` INTEGER,
    `activo` BOOLEAN NOT NULL,
    `firma` VARCHAR(255),

    UNIQUE INDEX `user.username_unique`(`username`),
    INDEX `IDX_2DA1797757698A6A`(`role`),
    INDEX `IDX_2DA179778D940019`(`workspace`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario_escritura` (
    `user_id` INTEGER NOT NULL,
    `nomenclador_id` INTEGER NOT NULL,

    INDEX `IDX_A2549460A76ED395`(`user_id`),
    INDEX `IDX_A2549460F874597B`(`nomenclador_id`),
    PRIMARY KEY (`user_id`, `nomenclador_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario_lectura` (
    `user_id` INTEGER NOT NULL,
    `nomenclador_id` INTEGER NOT NULL,

    INDEX `IDX_BF2C1716A76ED395`(`user_id`),
    INDEX `IDX_BF2C1716F874597B`(`nomenclador_id`),
    PRIMARY KEY (`user_id`, `nomenclador_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `voucher` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client` INTEGER,
    `reply` INTEGER,
    `beginDate` DATETIME(0) NOT NULL,
    `finishDate` DATETIME(0) NOT NULL,
    `creationDate` DATETIME(0) NOT NULL,
    `pax` INTEGER NOT NULL,
    `provider` VARCHAR(255) NOT NULL,
    `sisgerCode` VARCHAR(255),
    `user` INTEGER,
    `refproviders` VARCHAR(999),
    `services` LONGTEXT,
    `activo` BOOLEAN,
    `workspace` INTEGER,
    `firmado` BOOLEAN,

    INDEX `IDX_DC2F9C448D93D649`(`user`),
    INDEX `IDX_DC2F9C448D940019`(`workspace`),
    INDEX `IDX_DC2F9C44C7440455`(`client`),
    INDEX `IDX_DC2F9C44FDA8C6E0`(`reply`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `voucher_service` (
    `voucher_id` INTEGER NOT NULL,
    `service_id` INTEGER NOT NULL,

    INDEX `IDX_2250B0D528AA1B6F`(`voucher_id`),
    INDEX `IDX_2250B0D5ED5CA9E6`(`service_id`),
    PRIMARY KEY (`voucher_id`, `service_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `workspace` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `enabled` BOOLEAN NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `logo` VARCHAR(255) NOT NULL,
    `fullname` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `workspace_banking` (
    `banking_id` INTEGER NOT NULL,
    `workspace_id` INTEGER NOT NULL,

    INDEX `IDX_3F5B4E15758C76C`(`banking_id`),
    INDEX `IDX_3F5B4E1582D40A1F`(`workspace_id`),
    PRIMARY KEY (`banking_id`, `workspace_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ajuste` ADD FOREIGN KEY (`banking`) REFERENCES `banking`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ajuste` ADD FOREIGN KEY (`entrada`) REFERENCES `bankingentry`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `arancel` ADD FOREIGN KEY (`capitulo`) REFERENCES `capitulo`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `arancel` ADD FOREIGN KEY (`um`) REFERENCES `um`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bank` ADD FOREIGN KEY (`id`) REFERENCES `banking`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bankingentry` ADD FOREIGN KEY (`banking`) REFERENCES `banking`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bankingentry` ADD FOREIGN KEY (`recibo`) REFERENCES `recibo`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bulto` ADD FOREIGN KEY (`concepto`) REFERENCES `concepto`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `card` ADD FOREIGN KEY (`id`) REFERENCES `banking`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cash` ADD FOREIGN KEY (`id`) REFERENCES `banking`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client` ADD FOREIGN KEY (`user`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `concepto` ADD FOREIGN KEY (`consignado`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `concepto` ADD FOREIGN KEY (`contenedor`) REFERENCES `contenedor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `concepto` ADD FOREIGN KEY (`expediente`) REFERENCES `reply`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `concepto` ADD FOREIGN KEY (`remitente`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `conceptocosto` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `conceptogasto` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contenedor` ADD FOREIGN KEY (`mes`) REFERENCES `mes`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contenedor` ADD FOREIGN KEY (`tipo`) REFERENCES `tipocontenedor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `mes` ADD FOREIGN KEY (`anno`) REFERENCES `anno`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costo` ADD FOREIGN KEY (`id`) REFERENCES `recibo`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costo` ADD FOREIGN KEY (`idEgreso`) REFERENCES `idegreso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costo_conceptocosto` ADD FOREIGN KEY (`conceptocosto_id`) REFERENCES `conceptocosto`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costo_conceptocosto` ADD FOREIGN KEY (`costo_id`) REFERENCES `costo`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costorecurrente` ADD FOREIGN KEY (`id`) REFERENCES `recibo`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costorecurrente` ADD FOREIGN KEY (`idEgreso`) REFERENCES `idegreso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costorecurrente_inventario` ADD FOREIGN KEY (`costorecurrente_id`) REFERENCES `costorecurrente`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `costorecurrente_inventario` ADD FOREIGN KEY (`inventario_id`) REFERENCES `inventario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `document` ADD FOREIGN KEY (`client`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `document` ADD FOREIGN KEY (`type`) REFERENCES `documenttype`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ena` ADD FOREIGN KEY (`id`) REFERENCES `concepto`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `envio` ADD FOREIGN KEY (`id`) REFERENCES `concepto`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `extra` ADD FOREIGN KEY (`banking`) REFERENCES `banking`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `extra` ADD FOREIGN KEY (`entrada`) REFERENCES `bankingentry`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `extra` ADD FOREIGN KEY (`usuario`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `gasto` ADD FOREIGN KEY (`id`) REFERENCES `recibo`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `gasto` ADD FOREIGN KEY (`idEgreso`) REFERENCES `idegreso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `gasto_conceptogasto` ADD FOREIGN KEY (`conceptogasto_id`) REFERENCES `conceptogasto`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `gasto_conceptogasto` ADD FOREIGN KEY (`gasto_id`) REFERENCES `gasto`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ingreso` ADD FOREIGN KEY (`cliente`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ingreso` ADD FOREIGN KEY (`id`) REFERENCES `recibo`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ingreso` ADD FOREIGN KEY (`idIngreso`) REFERENCES `idingreso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ingreso_service` ADD FOREIGN KEY (`ingreso_id`) REFERENCES `ingreso`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ingreso_service` ADD FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ingresos_relacionados` ADD FOREIGN KEY (`costo_id`) REFERENCES `receipe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ingresos_relacionados` ADD FOREIGN KEY (`ingreso_id`) REFERENCES `receipe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `inventario` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `menaje` ADD FOREIGN KEY (`id`) REFERENCES `concepto`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `mercancia` ADD FOREIGN KEY (`arancel`) REFERENCES `arancel`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `mercancia` ADD FOREIGN KEY (`bulto`) REFERENCES `bulto`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `mercancia` ADD FOREIGN KEY (`miRelacionada`) REFERENCES `mercancia`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `mercancia` ADD FOREIGN KEY (`tarifa`) REFERENCES `tarifa`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `metodopago_banking` ADD FOREIGN KEY (`banking_id`) REFERENCES `banking`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `metodopago_banking` ADD FOREIGN KEY (`paymentmethod_id`) REFERENCES `paymentmethod`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `nomenclador` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `phone` ADD FOREIGN KEY (`client`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `precioventa` ADD FOREIGN KEY (`cliente`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `precioventa` ADD FOREIGN KEY (`expediente`) REFERENCES `reply`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `precioventa` ADD FOREIGN KEY (`expedienteLider`) REFERENCES `reply`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `receipe` ADD FOREIGN KEY (`entry`) REFERENCES `bankingentry`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `receipe` ADD FOREIGN KEY (`paymentMethod`) REFERENCES `paymentmethod`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `receipe` ADD FOREIGN KEY (`reply`) REFERENCES `reply`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `receipe` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `recibo` ADD FOREIGN KEY (`expediente`) REFERENCES `reply`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `recibo` ADD FOREIGN KEY (`metodoPago`) REFERENCES `paymentmethod`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `recibo` ADD FOREIGN KEY (`usuario`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `recibo` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply` ADD FOREIGN KEY (`leader`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply` ADD FOREIGN KEY (`user`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply_agency` ADD FOREIGN KEY (`agency_id`) REFERENCES `agency`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply_agency` ADD FOREIGN KEY (`reply_id`) REFERENCES `reply`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply_client` ADD FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply_client` ADD FOREIGN KEY (`reply_id`) REFERENCES `reply`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply_service` ADD FOREIGN KEY (`reply_id`) REFERENCES `reply`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reply_service` ADD FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `traspaso` ADD FOREIGN KEY (`destino`) REFERENCES `banking`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `traspaso` ADD FOREIGN KEY (`entryDestino`) REFERENCES `bankingentry`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `traspaso` ADD FOREIGN KEY (`entryOrigen`) REFERENCES `bankingentry`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `traspaso` ADD FOREIGN KEY (`origen`) REFERENCES `banking`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `traspaso` ADD FOREIGN KEY (`user`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD FOREIGN KEY (`role`) REFERENCES `role`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario_escritura` ADD FOREIGN KEY (`nomenclador_id`) REFERENCES `nomenclador`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario_escritura` ADD FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario_lectura` ADD FOREIGN KEY (`nomenclador_id`) REFERENCES `nomenclador`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario_lectura` ADD FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `voucher` ADD FOREIGN KEY (`client`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `voucher` ADD FOREIGN KEY (`reply`) REFERENCES `reply`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `voucher` ADD FOREIGN KEY (`user`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `voucher` ADD FOREIGN KEY (`workspace`) REFERENCES `workspace`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `voucher_service` ADD FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `voucher_service` ADD FOREIGN KEY (`voucher_id`) REFERENCES `voucher`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `workspace_banking` ADD FOREIGN KEY (`banking_id`) REFERENCES `banking`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `workspace_banking` ADD FOREIGN KEY (`workspace_id`) REFERENCES `workspace`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
