﻿using DotNet8.PosBackendApi.Models.Setup.SaleInvoice;

namespace DotNet8.PosBackendApi.Features.Setup.SaleInvoice
{
    public class BL_SaleInvoice
    {
        private readonly DL_SaleInvoice _saleInvoice;

        public BL_SaleInvoice(DL_SaleInvoice saleInvoice)
        {
            _saleInvoice = saleInvoice;
        }

        public async Task<SaleInvoiceListResponseModel> GetSaleInvoice()
        {
            var response = await _saleInvoice.GetSaleInvoice();
            return response;
        }

        public async Task<SaleInvoiceResponseModel> GetSaleInvoice(string voucherNo)
        {
            var response = await _saleInvoice.GetSaleInvoice(voucherNo);
            return response;
        }
    }
}
