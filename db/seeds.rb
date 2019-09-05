MissionsInvoice.destroy_all
Mission.destroy_all
Invoice.destroy_all
Client.destroy_all
Notification.destroy_all
User.destroy_all


user = User.create!(email: "contact@paula.com",
                    password: "testtest",
                    first_name: "Paula",
                    last_name: "DE LA PAMPA",
                    username: "PaulaDesign",
                    siret: "54645643",
                    vat: 0,
                    tax_rate: 0,
                    address: "13 rue Morand, 75011 Paris")

mae = Client.create!(user: user,
                    email: "lewagon@mae.com",
                    first_name: "Clarisse",
                    last_name: "MARTIN",
                    category: "professionelle",
                    company_name: "MAE - Mon auto-entreprise",
                    company_address: "16 villa Gaudelet, 75011 Paris")


botify = Client.create!(user: user,
                        email: "aurore@botify.com",
                        first_name: "Aurore",
                        last_name: "MALVAL",
                        category: "professionelle",
                        company_name: "Botify",
                        company_address: "15 Rue de Laborde, 75008 Paris")

typology = Client.create!(user: user,
                    email: "camille@typology.fr",
                    first_name: "Camille",
                    last_name: "OLEKSY",
                    category: "professionelle",
                    company_name: "Typology",
                    company_address: "61 Rue Pierre Charron, 75008 Paris")

frichti = Client.create!(user: user,
                        email: "antoine@frichti.com",
                        first_name: "Antoine",
                        last_name: "CARTIER",
                        category: "professionnelle",
                        company_name: "Fritchi",
                        company_address: "5 rue charlot, 75003 paris")

algolia = Client.create!(user: user,
                    email: "clarisse@algolia.com",
                    first_name: "Clarisse",
                    last_name: "MARTIN",
                    category: "professionelle",
                    company_name: "Algolia",
                    company_address: "55 Rue d'Amsterdam, 75008 Paris")

mae = Client.create!(user: user,
                    email: "lewagon@mae.com",
                    first_name: "Clarisse",
                    last_name: "MARTIN",
                    category: "professionelle",
                    company_name: "MAE - Mon auto-entreprise",
                    company_address: "16 villa Gaudelet, 75011 Paris")

alan = Client.create!(user: user,
                    email: "alan@alan.com",
                    first_name: "Alan",
                    last_name: "TURING",
                    category: "professionelle",
                    company_name: "Alan",
                    company_address: "117 Quai de Valmy, 75010 Paris")

superman = Client.create!(user: user,
                    email: "hero@auquotidien.com",
                    first_name: "Super",
                    last_name: "MAN",
                    category: "particulier",
                    company_name: "SUPERMAN SA",
                    company_address: "14 avenue Fritz Land, Metropolis")

proto_web = Mission.create!(name: "Prototypage d'interfaces - mock-ups")
exp_user = Mission.create!(name: "UX Research - focus group utilisateurs")
ab_test = Mission.create!(name: "A/B tests")
seo_test = Mission.create!(name: "SEO analysis")


invoice1 = Invoice.new(user: user,
                      title: "Product Design Sprint",
                      reference: "PDLP-023456",
                      creation_date: Date.strptime("24-04-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("24-05-2019", '%d-%m-%Y'),
                      payment_date: Date.strptime("22-05-2019", '%d-%m-%Y'),
                      total_amount_ttc: 900,
                      status: 3,
                      client: botify)


invoice1.save!

MissionsInvoice.create!(man_day_quantity: 3, price_rate: 300, vat_rate: 0, mission: proto_web, invoice: invoice1)

invoice2 = Invoice.new(user: user,
                      title: "SEO consultancy mission",
                      reference: "PDLP-023457",
                      creation_date: Date.strptime("14-05-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("14-06-2019", '%d-%m-%Y'),
                      payment_date: Date.strptime("09-06-2019", '%d-%m-%Y'),
                      total_amount_ttc: 3000,
                      status: 3,
                      client: typology)

invoice2.save!

MissionsInvoice.create!(man_day_quantity: 6, price_rate: 300, vat_rate: 0, mission: seo_test, invoice: invoice2)
MissionsInvoice.create!(man_day_quantity: 6, price_rate: 200, vat_rate: 0, mission: ab_test, invoice: invoice2)

invoice3 = Invoice.new(user: user,
                      title: "Tests sur les features de paiement",
                      reference: "PDLP-023457",
                      creation_date: Date.strptime("28-05-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("28-06-2019", '%d-%m-%Y'),
                      total_amount_ttc: 2700,
                      status: 2,
                      client: algolia)
invoice3.save!


MissionsInvoice.create!(man_day_quantity: 6, price_rate: 300, vat_rate: 0, mission: seo_test, invoice: invoice3)
MissionsInvoice.create!(man_day_quantity: 6, price_rate: 200, vat_rate: 0, mission: ab_test, invoice: invoice3)

invoice4 = Invoice.new(user: user,
                      title: "Conseil pour l'équipe de Business Developpement",
                      reference: "PDLP-023457",
                      creation_date: Date.strptime("28-05-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("28-06-2019", '%d-%m-%Y'),
                      total_amount_ttc: 2700,
                      status: 2,
                      client: algolia)
invoice4.save!

MissionsInvoice.create!(man_day_quantity: 10, price_rate: 270, vat_rate: 0, mission: exp_user, invoice: invoice4)


invoice5 = Invoice.new(user: user,
                      title: "Focus group utilisateurs app",
                      reference: "PDLP-023457",
                      creation_date: Date.strptime("30-06-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("30-07-2019", '%d-%m-%Y'),
                      payment_date: Date.strptime("24-07-2019", '%d-%m-%Y'),
                      total_amount_ttc: 2500,
                      status: 3,
                      client: frichti)
invoice5.save!
MissionsInvoice.create!(man_day_quantity: 10, price_rate: 250, vat_rate: 0, mission: exp_user, invoice: invoice5)

invoice6 = Invoice.new(user: user,
                      title: "Maintenance de site internet",
                      reference: "121218-AC0005",
                      creation_date: Date.strptime("12-08-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("12-09-2019", '%d-%m-%Y'),
                      total_amount_ttc: 5500,
                      status: 2,
                      client: superman)

invoice6.save!
MissionsInvoice.create!(man_day_quantity: 10, price_rate: 550, vat_rate: 0, mission: exp_user, invoice: invoice6)

invoice7 = Invoice.new(user: user,
                      title: "Constitution de portfolio",
                      reference: "121218-AC0005",
                      creation_date: Date.strptime("09-07-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("09-08-2019", '%d-%m-%Y'),
                      payment_date: Date.strptime("01-09-2019", '%d-%m-%Y'),
                      total_amount_ttc: 5500,
                      status: 3,
                      client: superman)

invoice7.save!

MissionsInvoice.create!(man_day_quantity: 10, price_rate: 550, vat_rate: 0, mission: proto_web, invoice: invoice7)

# invoice5 = Invoice.new(user: user,
#                       title: "Consulting",
#                       reference: "041118-AC0004",
#                       creation_date: Date.strptime("04-11-2018", '%d-%m-%Y'),
#                       due_date: Date.strptime("04-12-2018", '%d-%m-%Y'),
#                       total_amount_ttc: "5500",
#                       status: 2,
#                       client: cic)

# invoice5.save!
# MissionsInvoice.create!(man_day_quantity: 10, price_rate: 550, vat_rate: 0, mission: consulting, invoice: invoice5)

# invoice6 = Invoice.new(user: user,
#                       title: "Maintenance",
#                       reference: "301018-AC0003",
#                       creation_date: Date.strptime("30-10-2018", '%d-%m-%Y'),
#                       due_date: Date.strptime("30-11-2018", '%d-%m-%Y'),
#                       total_amount_ttc: "1500",
#                       status: 2,
#                       client: buzzman)

# invoice6.save!
# MissionsInvoice.create!(man_day_quantity: 10, price_rate: 150, vat_rate: 0, mission: maintenance_site3, invoice: invoice6)


# invoice7 = Invoice.new(user: user,
#                       title: "Développement",
#                       reference: "220918-AC0002",
#                       creation_date: Date.strptime("22-09-2018", '%d-%m-%Y'),
#                       due_date: Date.strptime("22-10-2018", '%d-%m-%Y'),
#                       total_amount_ttc: "4500",
#                       status: 1,
#                       client: kitchen_terre)

# invoice7.save!
# MissionsInvoice.create!(man_day_quantity: 10, price_rate: 450, vat_rate: 0, mission: bus_dev2, invoice: invoice7)



# invoice8 = Invoice.new(user: user,
#                       title: "Maintenance",
#                       reference: "040818-AC0001",
#                       creation_date: Date.strptime("04-08-2018", '%d-%m-%Y'),
#                       due_date: Date.strptime("04-09-2018", '%d-%m-%Y'),
#                       total_amount_ttc: "6750",
#                       status: 5,
#                       client: ddb)
# invoice8.save!
# MissionsInvoice.create!(man_day_quantity: 15, price_rate: 450, vat_rate: 0, mission: maintenance_site4, invoice: invoice8)

# invoice9 = Invoice.new(user: user,
#                       title: "MVP",
#                       reference: "040819-AC0001",
#                       creation_date: Date.strptime("04-08-2018", '%d-%m-%Y'),
#                       due_date: Date.strptime("04-09-2018", '%d-%m-%Y'),
#                       total_amount_ttc: "5050",
#                       status: 2,
#                       client: ddb)
# invoice9.save!
# MissionsInvoice.create!(man_day_quantity: 15, price_rate: 700, vat_rate: 0, mission: maintenance_site4, invoice: invoice9)


Invoice.all.each do |invoice|
  invoice.save!
  puts invoice.total_amount_ttc
end

puts "we created #{Invoice.count} invoices/10"

notif1 = Notification.new(user: User.last,
                  category: "Paiement reçu !",
                  content: "La facture numero #34567 vient d'être réglée par votre client BNP, pour un montant total de 345678 euros TTC.")
notif1.save!

notif2 = Notification.new(
                  user: User.last,
                  category: "Facture envoyée",
                  content: "Vous venez d'envoyer la facture #34556 à votre client Mme Michu, pour un montant total de 12 000 euros. Votre client a jusqu'au 13/12/2019 pour la régler.")
notif2.save!

notif3 = Notification.new(
                  user: User.last,
                  category: "Paiement en retard",
                  content: "Votre client Bolloré ne vous a toujours pas réglé la facture numéro #67543, d'un montant de 456 euros. Le paiement était dû au 12/04/2019.")
notif3.save!

notif4 = Notification.new(
                  user: User.last,
                  category: "Paiement reçu !",
                  content: "La facture numero #56789 vient d'être réglée par votre client Mère Michelle, pour un montant total de 10 euros TTC.")
notif4.save!

puts "we created #{Notification.count} notifications/4"
