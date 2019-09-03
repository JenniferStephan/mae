MissionsInvoice.destroy_all
Mission.destroy_all
Invoice.destroy_all
Client.destroy_all
Notification.destroy_all
User.destroy_all


user = User.create!(email: "paul@test.com",
                    password: "testtest",
                    first_name: "Paula",
                    last_name: "Paula",
                    username: "Jenn",
                    siret: "54645643",
                    vat: 0,
                    address: "13 rue morand")

societe_generale = Client.create!(user: user,
                        email: "aurore@soce.com",
                        first_name: "aurore",
                        last_name: "malval",
                        category: "pro",
                        company_name: "Societe generale",
                        company_address: "14 rue morand")

mae = Client.create!(user: user,
                    email: "camille@bnp.com",
                    first_name: "camille",
                    last_name: "ole",
                    category: "pro",
                    company_name: "Equipe MAE",
                    company_address: "le Wagon")

credit_agricole = Client.create!(user: user,
                                email: "antoine@credit.com",
                                first_name: "antoine",
                                last_name: "cartier",
                                category: "pro",
                                company_name: "Credit Agricole",
                                company_address: "la Defense")

ddb = Client.create!(user: user,
                    email: "christian@ddb.com",
                    first_name: "Chritian",
                    last_name: "Vince",
                    category: "pro",
                    company_name: "DDB",
                    company_address: "rue d'Amsterdam")

collectionist = Client.create!(user: user,
                    email: "alex@collectionist.com",
                    first_name: "Alexandre",
                    last_name: "Mercier",
                    category: "pro",
                    company_name: "Collectionist",
                    company_address: "rue de Ponthieu")

france_inter = Client.create!(user: user,
                    email: "salim@radiofrance.com",
                    first_name: "Salim",
                    last_name: "Jamaleddine",
                    category: "pro",
                    company_name: "France Inter",
                    company_address: "avenue du président Kennedy")

buzzman = Client.create!(user: user,
                    email: "quentin@buzzman.com",
                    first_name: "Quentin",
                    last_name: "Seguret",
                    category: "pro",
                    company_name: "Buzzman",
                    company_address: "rue Lafayette")

cic = Client.create!(user: user,
                    email: "marie@cic.com",
                    first_name: "Marie",
                    last_name: "Deltonne",
                    category: "pro",
                    company_name: "CIC",
                    company_address: "avenue Junot")

kitchen_terre = Client.create!(user: user,
                    email: "marin@kitchen-terre.com",
                    first_name: "Marin",
                    last_name: "Simon",
                    category: "pro",
                    company_name: "Kitchen Terre",
                    company_address: "boulevard saint germain")

le_wagon = Client.create!(user: user,
                    email: "sebastien@lewagon.org",
                    first_name: "Sebastien",
                    last_name: "Saunier",
                    category: "pro",
                    company_name: "Le Wagon Paris",
                    company_address: "villa Gaudelet")


web_design = Mission.create!(name: "Web design")
jour_TA = Mission.create!(name: "Journée TA")
bus_dev = Mission.create!(name: "Développement")
bus_dev2 = Mission.create!(name: "Développement")
maintenance_site = Mission.create!(name: "Maintenance")
maintenance_site2 = Mission.create!(name: "Maintenance")
maintenance_site3 = Mission.create!(name: "Maintenance")
maintenance_site4 = Mission.create!(name: "Maintenance")
consulting = Mission.create!(name: "Consulting")


invoice1 = Invoice.new(user: user,
                      title: "Journée TA",
                      reference: "210819-AC0008",
                      creation_date: Date.strptime("21-08-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("21-09-2019", '%d-%m-%Y'),
                      total_amount_ttc: "300",
                      status: 2,
                      client: le_wagon)


invoice1.save!

MissionsInvoice.create!(man_day_quantity: 3, price_rate: 100, vat_rate: 0, mission: jour_TA, invoice: invoice1)
# puts web_design_for_beta


invoice2 = Invoice.new(user: user,
                      title: "Web design",
                      reference: "140519-AC0007",
                      creation_date: Date.strptime("14-05-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("14-06-2019", '%d-%m-%Y'),
                      total_amount_ttc: "1000",
                      status: 2,

                      client: societe_generale)

invoice2.save!

MissionsInvoice.create!(man_day_quantity: 5, price_rate: 200, vat_rate: 0, mission: web_design, invoice: invoice2)

invoice3 = Invoice.new(user: user,
                      title: "Développement",
                      reference: "050319-AC0006",
                      creation_date: Date.strptime("05-03-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("05-04-2019", '%d-%m-%Y'),
                      payment_date: '2019-03-21',
                      total_amount_ttc: 2700,
                      status: 2,
                      client: collectionist)
invoice3.save!

MissionsInvoice.create!(man_day_quantity: 6, price_rate: 450, vat_rate: 0, mission: bus_dev, invoice: invoice3)

invoice3_1 = Invoice.new(user: user,
                      title: "Développement",
                      reference: "200319-AC0007",
                      creation_date: Date.strptime("30-08-2019", '%d-%m-%Y'),
                      due_date: Date.strptime("30-08-2019", '%d-%m-%Y'),
                      total_amount_ttc: 600,
                      status: 2,
                      client: collectionist)
invoice3_1.save!
MissionsInvoice.create!(man_day_quantity: 2, price_rate: 300, vat_rate: 0, mission: bus_dev, invoice: invoice3_1)

invoice4 = Invoice.new(user: user,
                      title: "Maintenance",
                      reference: "121218-AC0005",
                      creation_date: Date.strptime("12-12-2018", '%d-%m-%Y'),
                      due_date: Date.strptime("12-01-2019", '%d-%m-%Y'),
                      payment_date: '2019-01-08',
                      total_amount_ttc: 1500,
                      status: 2,
                      client: france_inter)

invoice4.save!

MissionsInvoice.create!(man_day_quantity: 10, price_rate: 150, vat_rate: 0, mission: maintenance_site2, invoice: invoice4)

invoice5 = Invoice.new(user: user,
                      title: "Consulting",
                      reference: "041118-AC0004",
                      creation_date: Date.strptime("04-11-2018", '%d-%m-%Y'),
                      due_date: Date.strptime("04-12-2018", '%d-%m-%Y'),
                      total_amount_ttc: "5500",
                      status: 2,
                      client: cic)

invoice5.save!
MissionsInvoice.create!(man_day_quantity: 10, price_rate: 550, vat_rate: 0, mission: consulting, invoice: invoice5)

invoice6 = Invoice.new(user: user,
                      title: "Maintenance",
                      reference: "301018-AC0003",
                      creation_date: Date.strptime("30-10-2018", '%d-%m-%Y'),
                      due_date: Date.strptime("30-11-2018", '%d-%m-%Y'),
                      total_amount_ttc: "1500",
                      status: 2,
                      client: buzzman)

invoice6.save!
MissionsInvoice.create!(man_day_quantity: 10, price_rate: 150, vat_rate: 0, mission: maintenance_site3, invoice: invoice6)


invoice7 = Invoice.new(user: user,
                      title: "Développement",
                      reference: "220918-AC0002",
                      creation_date: Date.strptime("22-09-2018", '%d-%m-%Y'),
                      due_date: Date.strptime("22-10-2018", '%d-%m-%Y'),
                      total_amount_ttc: "4500",
                      status: 1,
                      client: kitchen_terre)

invoice7.save!
MissionsInvoice.create!(man_day_quantity: 10, price_rate: 450, vat_rate: 0, mission: bus_dev2, invoice: invoice7)



invoice8 = Invoice.new(user: user,
                      title: "Maintenance",
                      reference: "040818-AC0001",
                      creation_date: Date.strptime("04-08-2018", '%d-%m-%Y'),
                      due_date: Date.strptime("04-09-2018", '%d-%m-%Y'),
                      total_amount_ttc: "6750",
                      status: 5,
                      client: ddb)
invoice8.save!
MissionsInvoice.create!(man_day_quantity: 15, price_rate: 450, vat_rate: 0, mission: maintenance_site4, invoice: invoice8)

invoice9 = Invoice.new(user: user,
                      title: "MVP",
                      reference: "040819-AC0001",
                      creation_date: Date.strptime("04-08-2018", '%d-%m-%Y'),
                      due_date: Date.strptime("04-09-2018", '%d-%m-%Y'),
                      total_amount_ttc: "5050",
                      status: 2,
                      client: ddb)
invoice9.save!
MissionsInvoice.create!(man_day_quantity: 15, price_rate: 700, vat_rate: 0, mission: maintenance_site4, invoice: invoice9)


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
