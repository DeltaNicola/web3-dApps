const VendingMachine = artifacts.require('VendingMachine');

contract('VendingMachine', ( accounts ) => {

    before( async () => {
        instance = await VendingMachine.deployed()
    })

    it('ensure starting donuts of the vending machine are 100', async () => {
        let balance = await instance.getVendingMachineBalance()
        assert.equal( balance, 100, 'starting donuts should be 100')
    })

    it('ensure balance of vending machine is updatable', async () => {
        await instance.restock( 100 )
        let balance = await instance.getVendingMachineBalance()
        assert.equal( balance, 200, 'updated donuts should be 200')
    })

    it('allow purchases', async() => {
        await instance.purchase( 1, { from: accounts[0], value: web3.utils.toWei( '5', 'ether' ) } )
        let balance = await instance.getVendingMachineBalance()
        assert.equal( balance, 199, 'updated donuts should be 199')
    })
    
})