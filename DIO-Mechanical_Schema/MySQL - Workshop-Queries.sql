-- Custo diário de cada equipe e seus líderes | Daily cost of each team and their leaders
SELECT t.idTeam, t.idLeader, concat(wk.Wname, " ", wk.Wsurname) AS name, 
cv.integration, SUM(w.daily_cost) AS team_daily
FROM team t
LEFT JOIN worker wk ON t.idLeader = wk.idWorker
JOIN convocation cv ON t.idTeam = cv.idTeam
LEFT JOIN worker w ON cv.idWorker = w.idWorker
GROUP BY t.idTeam;

-- Quais equipes custam menos que $600 a diária? | Whats teams cost minor than $600 daily?
SELECT t.idTeam, t.idLeader, concat(wk.Wname, " ", wk.Wsurname) AS name, 
cv.integration, SUM(w.daily_cost) AS team_daily
FROM team t
LEFT JOIN worker wk ON t.idLeader = wk.idWorker
JOIN convocation cv ON t.idTeam = cv.idTeam
LEFT JOIN worker w ON cv.idWorker = w.idWorker
GROUP BY t.idTeam
HAVING team_daily < 600;

-- Qual o histórico de serviços? | Whats is the order history?
SELECT * FROM orders;

-- Insumos utilizados por Ordem de Serviço | Material used by service order
SELECT n.idOS, m.idMaterial, m.Mname, n.quantity, m.price, quantity * price AS total_cost
FROM necessity n
JOIN material m ON n.idMaterial = m.idMaterial
ORDER BY idOS;

-- Mão de Obra utilizada por Ordem de Serviço | Workhand used by service order
SELECT os.idOrder, os.idTeam, (finishes - started) * team_daily AS workhand, revenue
FROM orders os
JOIN	(SELECT t.idTeam, SUM(w.daily_cost) AS team_daily FROM team t
		JOIN convocation cv ON t.idTeam = cv.idTeam
        JOIN worker w ON cv.idWorker = w.idWorker
        GROUP BY idTeam) t
ON t.idTeam = os.idTeam;

-- Custos, Receitos e Lucro por Ordem de Serviço | Cost, revenue and profit by service order
SELECT os.idOrder, os.idTeam, (finishes - started) * team_daily AS workhand, IFNULL(n.total_cost, 0) AS material_cost,
revenue, revenue - (((finishes - started) * team_daily) + IFNULL(n.total_cost, 0)) AS profit
FROM orders os
JOIN	(SELECT t.idTeam, SUM(w.daily_cost) AS team_daily FROM team t
		JOIN convocation cv ON t.idTeam = cv.idTeam
        JOIN worker w ON cv.idWorker = w.idWorker
        GROUP BY idTeam) t
ON t.idTeam = os.idTeam
LEFT JOIN	(SELECT n.idOS, n.quantity * m.price AS total_cost
			FROM necessity n
			JOIN material m ON n.idMaterial = m.idMaterial
			ORDER BY n.idOS) n
ON os.idOrder = n.idOS;

-- Quais materiais foram utilizados em cada veículo? | What materials used for each vehicle?
SELECT v.license_plate, v.model, m.Mname, n.quantity
FROM vehicle v
JOIN orders os ON v.license_plate = os.license_plate
JOIN necessity n ON os.idOrder = n.idOS
JOIN material m ON n.idMaterial = m.idMaterial;

-- Quais trabalhos foram feitos por veículo? | What's job did for each vehicle?
SELECT v.license_plate, v.model, s.Scname, s.category FROM vehicle v
JOIN orders os ON v.license_plate = os.license_plate
JOIN servicebyos sb ON os.idOrder = sb.idOS
JOIN service s ON sb.idService = s.idService;