resource_group ={
    rg = {
        rg_name = "az-3tire-rg"
        location = "East US2"
    }
}
virtual_network = {
    vnet = {
        vnet_name = "az-3tire-vnet"
        address_space = ["10.0.0.0/16"]
        rg_name = "az-3tire-rg"
        location = "East US2"
        
    }
}