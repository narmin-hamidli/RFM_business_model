/*
============================================================================
 Step 2: Extract Filtered Transactions
============================================================================
 Description:
   Pulls raw bank transactions and excludes non-relevant MCC (Merchant
   Category Code) groups that should not feed into the RFM (Recency,
   Frequency, Monetary) business model. Runs after the data-insert step
   that populates BANK_TRANSACTIONS_RAW.

 Excluded MCC groups:
   - UTILITY
   - MONEY TRANSFER
   - OTHER
   - OTHER STORES
   - GOVERNMENT SERVICES
   - FINANCE SERVICES

 Output columns:
   TRANSACTION_DATE, CUSTOMER_ID, MCC, TERM_LOCATION, TERM_ID, AMOUNT
============================================================================
*/

select
    TRANSACTION_DATE,
    CUSTOMER_ID,
    MCC,
    TERM_LOCATION,
    TERM_ID,
    AMOUNT
from
    bank_transactions_raw
where
    1 = 1
    and CUSTOMER_ID is not null
    and MCC not in ('4900', '4815', '4813', '4821', '4816', '4814') --'UTILITY'
    and MCC not in (
        '6539',
        '6534',
        '6531',
        '6536',
        '6540',
        '6538',
        '6537',
        '4829'
    ) --'MONEY TRANSFER'
    and MCC not in ('7273', '6236', '9950', '7272') -- 'OTHER'
    and MCC not in (
        '5451',
        '5973',
        '5931',
        '5937',
        '5932',
        '5261',
        '5051',
        '5933',
        '5412',
        '5935',
        '5331',
        '5422',
        '5271',
        '5999',
        '5993',
        '5972',
        '5399',
        '5978',
        '5310',
        '5199',
        '5997',
        '5297',
        '5299',
        '5046',
        '5309',
        '5300',
        '5998',
        '5996',
        '5974',
        '5169',
        '5994'
    ) --'OTHER STORES'
    and MCC not in (
        '9401',
        '9222',
        '9399',
        '9223',
        '9402',
        '9702',
        '9311',
        '9406',
        '7276',
        '9211',
        '9034',
        '9411'
    ) --'GOVERNMENT SERVICES'
    and MCC not in (
        '6533',
        '6051',
        '6011',
        '6529',
        '7322',
        '6028',
        '6025',
        '6026',
        '7321',
        '6012',
        '7278',
        '0011',
        '6532',
        '6530',
        '6760',
        '6611',
        '6022',
        '6050',
        '9405',
        '6535',
        '6023',
        '6555',
        '6010'
    ); --'FINANCE SERVICES'
