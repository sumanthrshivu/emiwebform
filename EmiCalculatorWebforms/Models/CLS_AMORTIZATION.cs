using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmiCalculatorWebforms.Models
{
    public class CLS_AMORTIZATION
    {
        public string INSTALLMENTNO { get; set; }

        //public string OPENINGBALANCE { get; set; }
        public string EMIAmount { get; set; }
        public string PRINCIPAL { get; set; }
        public string INTEREST { get; set; }

        public string BalanceAmount { get; set; }
    }
}