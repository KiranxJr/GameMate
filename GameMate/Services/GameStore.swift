
import Foundation
import IGDB_SWIFT_API

class GameStore {
    
    static let shared = GameStore()
    
    private let igdb: IGDBWrapper

    private init() {
        // Replace with your actual client ID and access token
        igdb = IGDBWrapper(clientID: "YOUR_CLIENT_ID", accessToken: "YOUR_ACCESS_TOKEN")
    }

    func fetchGames(completion: @escaping (Result<[Proto_Game], Error>) -> Void) {
        let query = APICalypse()
            .fields(fields: "name, rating, cover.image_id")
            .limit(value: 10)

        igdb.games(apiCalypse: query, result: { games in
            DispatchQueue.main.async {
                completion(.success(games))
            }
        }, errorResponse: { error in
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        })
    }
}
