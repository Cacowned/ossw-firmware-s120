#include "ext_ram.h"
#include "spi.h"
#include "bsp/boards.h"

bool ext_ram_init(void) {
    uint8_t command[] = {EXT_RAM_WRITE_STATUS_COMMAND, EXT_RAM_STATUS_SEQUENCE | EXT_RAM_HOLD_DISABLE};
    return spi_master_tx(EXT_RAM_SPI, EXT_RAM_SPI_SS, command, 2);
}

bool ext_ram_read_data(uint16_t ext_ram_address, uint8_t *buffer, uint32_t data_size){
	  uint8_t command[] = {EXT_RAM_READ_COMMAND, 0xFF, 0xFF};
    command[1] = ext_ram_address >> 8 & 0xFF;
    command[2] = ext_ram_address & 0xFF;
    return spi_master_rx_data(EXT_RAM_SPI, EXT_RAM_SPI_SS, command, 3, buffer, data_size);
}

bool ext_ram_write_data(uint16_t ext_ram_address, uint8_t *buffer, uint32_t data_size){
	  uint8_t command[] = {EXT_RAM_WRITE_COMMAND, 0xFF, 0xFF};
    command[1] = ext_ram_address >> 8 & 0xFF;
    command[2] = ext_ram_address & 0xFF;
    return spi_master_tx_data(EXT_RAM_SPI, EXT_RAM_SPI_SS, command, 3, buffer, data_size);
 
}
