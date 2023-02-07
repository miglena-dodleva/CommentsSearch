//
//  CommentsRepository.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//


protocol CommentsRepository {

    func searchComments(query: String) async throws -> [CommentsDto]
}
