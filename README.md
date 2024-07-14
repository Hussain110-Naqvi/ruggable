Repository Navigation 

Models are generated under the models folder and also have their subsequent dbt tests attached with them in the corresponding .yml file. The macros folder contains custom SQL tests that reference each model. Snapshots are saved under the snapshots folder.

There are a total of 4 models, 2 snapshots, and 12 tests. All have passed and have been verified.

The sample_output folder showcases sample outputs of each model.

Preface

As there wasn't nessecarily a direct business question that was asked, I operated with a sense of novelty in identifying any patterns or unique data stores that could offer meaning. There could certainly be more analysis's that could be done with this dataset, but given the time limitations, I thought to address some that stood out to me. As well, I've defined some metrics by myself and based on my interpretation of the data - it's entirely possible that the business team may have a completely different method of determining some of these metrics. 

Models & Insights

Operations

For the operations teams, the below_depletion_level model represents the product name and variant of those items that have their stock level below the depletion level. It would be incredibly beneficial for operations teams to keep an eye on this data to know when they have to order new product. The model outputs a prioritized inventory of those product names and variants at the lowest stock levels for identification for the operations team.

To further support this endeavour, a snapshot has also been generated on the low stock checkmark. This snapshot will help operations teams identify when the low stock checkmark was switched on/off (using the updated_at column) so they can act accordingly in their supply chain workflow. This snapshot is saved under low_stock_indicator. Key features have also been identified as a unique key to adequately locate the low inventory item.

Now it's also imperative to keep in mind that there could be cashflow constraints or other resource contraints that limit operations folks to bulk order such large quantities. To account for this, a list of prioritized items and their variants for backorder is generated in the priority_order model which is a derivative of the below_depletion_level model. This prioritized list is generated based on the amount of profit that each product and it's associated variant could come with. This could also support the marketing team as they would be focusing their efforts on products with a larger scope of profit.

Product 

Product teams would need to know which products, and their specific variants are not selling as well as they should. This is critical to keep in mind because product teams would need to invest in these products perhaps through re-design, through color-changes etc. This could be determined by doing an analysis of products that are old arrivals, yet have stock levels above depletion levels. Items that are not new would be expected to be at depletion levels in terms of their stock. They specs of these should be given to the marketing team, especially for those with the highest stock level: depletion level ratios so they can focus on that product line. We'll focus on the Top 10 for the most concentrated effort. The underselling_product_specs model highlights this.

Marketing 

The marketing team could benefit from knowing which inventory is rapidly selling out. They could use this information to leverage greater upsells because inventory that is rapidly selling out is more likely to convert into upsells. More upsell focus could also result in more revenue. The hot_upsell model determines which products are selling out quickly, yet also pose the greatest profit margin for upsell for the marketing team to allocate resources proportionately across different product lines. We'll also focus on those that have stock for upsell as opposed to those upsells that are already sold out.

On a short term, the marketing team could also benefit from knowing how to organize their marketing campaigns. This could be done by knowing the availability of when new inventory would come in so they initiate marketing for it. As well, the marketing team would need to know when items are on clearance. This would pull from the rugs_usa_parent table. Both of these data elements are captured using dbt snapshots which can be leveraged to determine when items go on/off clearance or if the availability date for the rugs changes. This way the marketing team can plan their campaigns accordingly. This is tracked in the availability_clearance_rugs snapshot. The URL has been identified as the unique key for the marketing team to reference the link on the company website.